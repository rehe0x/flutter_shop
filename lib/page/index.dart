

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';
import 'search/search.dart';
import '../theme/themes.dart';
import '../constant/custom_icons.dart';
import '../provider/navigation_provider.dart';

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
    const Home(title: '首页',),
    const Home(title: '精选'),
    const Search(),
    const Home(title: '购物车'),
    const Home(title: '账户'),
  ];
  
  const AppIndex({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 全局TabController
    final CupertinoTabController cupertinoTabController = Provider.of<NavigationProvider>(context, listen: false).cupertinoTabController;
    return CupertinoTabScaffold(
        controller: cupertinoTabController,
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
              Provider.of<NavigationProvider>(context, listen: false).updateSearchFocus(true);
            }
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          /// 问题 键盘弹出关闭 会执行很多次
          debugPrint('tabBuilder index: $index');
          return _pages[index];
        }
    );
  }
}
