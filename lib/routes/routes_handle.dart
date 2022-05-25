import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes_model.dart';
import '../page/account/account.dart';
import '../page/activity/activity.dart';
import '../page/cart/cart.dart';
import '../page/cart/cart_settlement.dart';
import '../page/goods/goods_detail2.dart';
import '../page/goods/goods_list.dart';
import '../page/home/home.dart';
import '../page/login/login.dart';
import '../page/search/search.dart';
import '../page/index.dart';
import '../page/search/search_body.dart';
import '../page/splash/splash.dart';

enum Water {
  frozen(32),
  lukewarm(100),
  boiling(212);

  const Water(this.tempInFahrenheit);
  final int tempInFahrenheit;
}

class RoutePages {
  /// app
  static const String test = '/test';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String loginMobile = '/login/mobile';
  /// index
  static const String index = '/index';
  /// tab
  static const String indexHome = '/index/home';
  static const String indexActivity = '/index/activity';
  static const String indexSearch = '/index/search';
  static const String indexCart = '/index/cart';
  static const String indexCartSettlement = '/index/cart/settlement';
  static const String indexGoodsDetail = '/index/goods/detail';
  static const String indexAccount = '/index/account';
  /// body
  static const String bodySearch = '/body/search';
  static const String bodyGoods = '/body/goods';

  

  // static const String indexHome = '/index/home';
  // static const String indexHome = '/index/home';
  // static const String indexHome = '/index/home';

}

/// 路由配置
class RouteHandle{

/// 创建路由页
static Page createPage(RouteInfo routeInfo) {
    debugPrint('_createPage$routeInfo');
    Widget child;

    switch (routeInfo.name) {
      case RoutePages.test:
        child = const SplashPage();
        break;
      case RoutePages.splash:
        child = const SplashPage();
        break;
      case RoutePages.login:
        child = const Login();
        break;
      case RoutePages.loginMobile:
        child =  LoginMobile();
        break;
      case RoutePages.index:
        child = const AppIndex();
        break;
      case RoutePages.indexHome:
        child = const Home(title: 'Logo');
        break;
      case RoutePages.indexActivity:
        child = const Activity();
        break;
      case RoutePages.indexSearch:
        child =  const Search();
        break;
      case RoutePages.indexCart:
        child =  const Cart();
        break;
      case RoutePages.indexAccount:
        child =  const Account();
        break;
      case RoutePages.indexCartSettlement:
        child =  const CartSettlement();
        break;
      case RoutePages.bodySearch:
        child = const SearchBody();
        break;
      case RoutePages.bodyGoods:
        child =  const GoodsList();
        break;
      case RoutePages.indexGoodsDetail:
        // child = GoodsDetail(goodsArgument: routeInfo.arguments as GoodsArgument,);
        child = GoodsDetail2();
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