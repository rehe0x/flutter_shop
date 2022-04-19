import 'package:flutter/material.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../provider/app_global.dart';
import '../../theme/themes.dart';
import '../../widget/search_field.dart';

/// 搜索页 带子路由
class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const SearchField(height: 40, autofocus: true),
        toolbarHeight: 45.h,
        backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        elevation: 0.0,
      ),
      body: const _SearchRoute()
    );
  }
}

/// 搜索页子路由
class _SearchRoute extends StatelessWidget {
  const _SearchRoute({Key? key}) : super(key: key);

 
  // @override
  // Widget build(BuildContext context) {
  //   return Navigator(
  //     key: AppGlobal.searchNavigatorKey,
  //     initialRoute: 'search',
  //     // 键盘事件
  //     requestFocus: false,
  //     onGenerateRoute: (RouteSettings settings) {
  //       WidgetBuilder builder;
  //       switch (settings.name) {
  //         case 'search':
  //           builder = (BuildContext context) =>  const SearchBody();
  //           break;
  //         case 'goods_item':
  //           builder = (BuildContext context) => const SearchGoodsBody();
  //           break;
  //         default:
  //           builder = (BuildContext context) => const Text('404');
  //           break;
  //       }
        
  //       return  CupertinoPageRoute(builder: builder, settings: settings);
  //     },
  //   );
  // }
  /// 改用自定义路由器
  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: AppGlobal.appRouterDelegate,
    );
  }
}

