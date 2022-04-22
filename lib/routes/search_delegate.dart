
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/app_global.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/routes/routes_model.dart';

/// 搜索页路由器
class SearchRouterDelegate extends RouterDelegate<List<RouteInfo>>
    with PopNavigatorRouterDelegateMixin<List<RouteInfo>>, ChangeNotifier {
  
  /// 路由列表
  final  List<Page<dynamic>> _pages = [RouteHandle.createPage(const RouteInfo(name: RoutePages.search,arguments: null))];

  /// 获取路由代理对象
  static SearchRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is SearchRouterDelegate, 'Delegate type must match');
    return delegate as SearchRouterDelegate;
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<RouteInfo> get currentConfiguration {
    return _pages
        .map((page) => RouteInfo(name: page.name! ,arguments: page.arguments))
        .toList();
  }

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
    _pages.add(RouteHandle.createPage(RouteInfo(name: name, arguments: arguments)));
    AppGlobal.eventBus.fire(RouteInfo(name: name, arguments: arguments));
    notifyListeners();
  }

   /// 返回上层
  void pop() {
    debugPrint('pop');
    if (_pages.isNotEmpty && _pages.length > 1) {
      _pages.remove(_pages.last);
      AppGlobal.eventBus.fire(RouteInfo(name: _pages.last.name!, arguments: _pages.last.arguments));
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
  Future<void> setNewRoutePath(List<RouteInfo> configuration) {
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
      AppGlobal.eventBus.fire(RouteInfo(name: _pages.last.name!, arguments: _pages.last.arguments));
      return true;
    } else {
      return false;
    }
  }

}
