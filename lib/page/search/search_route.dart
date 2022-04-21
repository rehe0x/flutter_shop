
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'search_body.dart';
import 'search_goods.dart';

/// 搜索页路由配置
class RouteHandle{
  /// 创建路由页
  static Page createPage(RouteSettings routeSettings) {
      debugPrint('_createPage$routeSettings');
      Widget child;

    switch (routeSettings.name) {
      case '/search':
        child = const SearchBody();
        break;
      case '/goods':
        child =  SearchGoodsBody();
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



/// 自定义路由代理
class SearchRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with PopNavigatorRouterDelegateMixin<List<RouteSettings>>, ChangeNotifier {
  
  /// 路由列表
  final  List<Page<dynamic>> _pages = [RouteHandle.createPage(const RouteSettings(name: '/search',arguments: null))];

  /// 获取路由代理对象
  static SearchRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is SearchRouterDelegate, 'Delegate type must match');
    return delegate as SearchRouterDelegate;
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  @override
  Widget build(BuildContext context) {
    debugPrint('${describeIdentity(this)}._pages: $_pages');
    return Navigator(
      key: navigatorKey,
      requestFocus: false,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  // 添加路由
  void push({required String name, dynamic arguments}) {
     debugPrint('push: $name');
    _pages.add(RouteHandle.createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

   /// 返回上层
  void pop() {
    debugPrint('pop');
    if (_pages.isNotEmpty && _pages.length > 1) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  /// 替换当前路由
  void replace({required String name, dynamic arguments}) {
    debugPrint('replace: $name');
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name,arguments: arguments);
  }

  /// 获取最后页
  Page lastPage() {
    return _pages.last;
  }

 @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    return Future.value(null);
  }

  /// 物理按键返回路由 防止退出app
  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      debugPrint('popRoute: ');
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(true);
  }

  bool canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    debugPrint('_onPopPage: $route');
    if (!route.didPop(result)) return false;

    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

}
