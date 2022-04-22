import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/goods/goods_detail.dart';
import 'package:flutter_shop/page/goods/goods_list.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/routes/routes_model.dart';

import '../page/index.dart';
import '../page/search/search_body.dart';
import '../page/splash/splash.dart';

class RoutePages {
  static const String test = '/test';
  static const String splash = '/splash';
  static const String index = '/index';
  static const String search = '/search';
  static const String goodsList = '/goods/list';
  static const String goodsDetail = '/goods/detail';
}

/// 路由配置
class RouteHandle{

/// 创建路由页
static Page createPage(RouteInfo routeInfo) {
    debugPrint('_createPage$routeInfo');
    Widget child;

    switch (routeInfo.name) {
      case RoutePages.index:
        child = const AppIndex();
        break;
      case RoutePages.splash:
        child = const SplashPage();
        break;
      case RoutePages.test:
        child = const SplashPage();
        break;
      case RoutePages.search:
        child = const SearchBody();
        break;
      case RoutePages.goodsList:
        child =  const GoodsList();
        break;
      case RoutePages.goodsDetail:
        child = GoodsDetail(goodsArgument: routeInfo.arguments as GoodsArgument,);
        break;
      default:
        child = const Scaffold();
    }

    return CupertinoPage(
      child: child,
      key: Key(routeInfo.name) as LocalKey,
      name: routeInfo.name,
      arguments: routeInfo.arguments,
    );
  }
}