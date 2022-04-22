import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/goods/goods_detail.dart';
import 'package:flutter_shop/page/goods/goods_list.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/routes/routes_model.dart';

import '../page/index.dart';
import '../page/search/search_body.dart';
import '../page/splash/splash.dart';

enum PagesEnum {
  test,
  splash,
  indexs,
  search,
  goodsList,
  goodsDetail,
}

/// 路由配置
class RouteHandle{

/// 创建路由页
static Page createPage(RouteInfo routeInfo) {
    debugPrint('_createPage$routeInfo');
    Widget child;

    switch (routeInfo.pagesEnum) {
      case PagesEnum.indexs:
        child = const AppIndex();
        break;
      case PagesEnum.splash:
        child = const SplashPage();
        break;
      case PagesEnum.test:
        child = const SplashPage();
        break;
      case PagesEnum.search:
        child = const SearchBody();
        break;
      case PagesEnum.goodsList:
        child =  const GoodsList();
        break;
      case PagesEnum.goodsDetail:
        child = GoodsDetail(goodsArgument: routeInfo.arguments as GoodsArgument,);
        break;
      default:
        child = const Scaffold();
    }

    return CupertinoPage(
      child: child,
      key: Key(routeInfo.pagesEnum.toString().split('.').last) as LocalKey,
      name: routeInfo.pagesEnum.toString().split('.').last,
      arguments: routeInfo.arguments,
    );
  }
}