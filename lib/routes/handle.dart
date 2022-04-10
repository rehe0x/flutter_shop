import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../page/index.dart';
import '../page/splash/splash.dart';

class RouteHandle{
  
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
      // case '/details':
      //   child = Details(routeSettings.arguments! as Map<String, String>);
      //   break;
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