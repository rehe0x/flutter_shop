import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/goods/goods.dart';

import '../page/index.dart';
import '../page/search/search_body.dart';
import '../page/search/search_goods.dart';
import '../page/splash/splash.dart';

/// 路由配置
class RouteHandle{

/// 创建路由页
static Page createPage(RouteSettings routeSettings) {
    debugPrint('_createPage$routeSettings');
    Widget child;

    switch (routeSettings.name) {
      case '/index':
        child = const AppIndex();
        break;
      case '/splash':
        child = const SplashPage();
        break;
      case '/test1':
        child = const SplashPage();
        break;
      case '/search':
        child = const SearchBody();
        break;
      case '/search/goods':
        child =  const SearchGoodsBody();
        break;
      case '/goods/detail':
        child = GoodsDetail(routeSettings.arguments as Map<String, String>);
        break;
      default:
        child = const Scaffold();
    }

    return CupertinoPage(
      child: child,
      key: Key(routeSettings.name!) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }
}