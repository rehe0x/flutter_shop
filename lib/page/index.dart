

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/cart/cart.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/index_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/routes/routes_model.dart';

import '../common/screenutil/src/size_extension.dart';
import '../common/screenutil/src/screen_util.dart';
import '../provider/app_global.dart';
import '../routes/body_delegate.dart';
import 'home/home.dart';
import 'search/search.dart';
import '../theme/themes.dart';
import '../constant/custom_icons.dart';

/// 首页保护底部菜单脚手架ios风格
class AppIndex extends StatelessWidget {
  static final  List _tabs = [
    {'icon': CustomIcons.home, 'text': '首页'},
    {'icon': CustomIcons.service, 'text': '精选'},
    {'icon': CustomIcons.search, 'text': '搜索'},
    {'icon': CustomIcons.cart, 'text': '购物车'},
    {'icon': CustomIcons.people, 'text': '账户'}
  ];

  /// 底部菜单对应页面
  static final List<Widget> _pages = [
    const Home(title: 'Logo',),
    const Home(title: '精选'),
    const Search(),
    const Cart(),
    const Home(title: '账户'),
  ];
  
  const AppIndex({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(390, 844),
      minTextAdapt: true,
      orientation: Orientation.portrait);
      
    debugPrint('w=${100.w}, h=${100.h}, r=${100.r}, sp= ${100.sp}, pixelRatio=${ScreenUtil().pixelRatio}, screenWidth=${ScreenUtil().screenWidth}, screenHeight=${ScreenUtil().screenHeight}');
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          tabLabelTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp
          )
        )
      ),
      child: CupertinoTabScaffold(
        
          controller: AppGlobal.cupertinoTabController,
          tabBar: CupertinoTabBar(
            backgroundColor: AppThemes.of(context).primaryBackgroundColor,
            inactiveColor: AppThemes.of(context).bottomAppBarColor,
            activeColor: AppThemes.of(context).primaryColor,
            
            items: _tabs.map((tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon']),
                label: tab['text'])).toList(),
            onTap: (int index){
              /// 如果是搜索页 默认打开搜索框焦点
              if (index == 2) {
                BodyRouterDelegate? routerDelegate = RouteBaseDelegate.of<BodyRouterDelegate>(context);
                if (routerDelegate == null || !routerDelegate.canPop()) {
                  AppGlobal.updateSearchFocus(true);
                }
              }
            },
          ),
          tabBuilder: (BuildContext context, int index) {
            /// 问题 键盘弹出关闭 会执行很多次
            debugPrint('tabBuilder index: $index');
            // return _pages[index];
            return IndexRoute(index,);
          }
      ),
    );
  }
}


/// 单列tab
class IndexRoute extends StatelessWidget {

  final int index;

  static final Map<int, IndexRoute> _map= {};

  const IndexRoute._(this.index ,{Key? key}) : super(key: key);

  factory IndexRoute(int index) => _instance(index);

  static IndexRoute _instance(int index){
    if (!_map.containsKey(index)) {
      _map[index] = IndexRoute._(index);
    }
    return _map[index]!;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${describeIdentity(this)}.$index');
    RouteInfo routeInfo;
    if(index == 0) {
      routeInfo = const RouteInfo(name: RoutePages.indexHome);
    }else if(index == 1) {
      routeInfo = const RouteInfo(name: RoutePages.indexActivity);
    }else if(index == 2) {
      routeInfo = const RouteInfo(name: RoutePages.indexSearch);
    }else if(index == 3) {
      routeInfo = const RouteInfo(name: RoutePages.indexCart);
    }else{
      routeInfo = const RouteInfo(name: RoutePages.indexAccount);
    }
    return Scaffold(
      body: Router(
        routerDelegate: IndexRouterDelegate(initRoute: routeInfo),
      ),
    );
  }
}
