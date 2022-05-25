
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'routes_handle.dart';
import 'routes_model.dart';

/// 二级路由
class IndexRouterDelegate extends RouterDelegate<List<RouteInfo>>
    with PopNavigatorRouterDelegateMixin<List<RouteInfo>>, ChangeNotifier {
      
  /// 初始路由
  RouteInfo initRoute;
  
  IndexRouterDelegate({
    required this.initRoute
  }): pages = [RouteHandle.createPage(initRoute)];
  
  /// 路由列表
  List<Page<dynamic>> pages = [];

  /// 获取路由代理对象
  static IndexRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is IndexRouterDelegate, 'Delegate type must match');
    return delegate as IndexRouterDelegate;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();
  
  @override
  List<RouteInfo> get currentConfiguration {
    return pages
        .map((page) => RouteInfo(name: page.name! ,arguments: page.arguments))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${describeIdentity(this)}._pages: $pages');
    return Navigator(
      requestFocus: false,
      onPopPage: _onPopPage,
      pages: List.of(pages),
    );
  }

  // 添加路由
  void push({required String name, dynamic arguments}) {
    debugPrint('${describeIdentity(this)}.push: $name');
    pages.add(RouteHandle.createPage(RouteInfo(name: name, arguments: arguments)));
    notifyListeners();
  }

   /// 返回上层
  void pop() {
    debugPrint('${describeIdentity(this)}.pop');
    if (pages.isNotEmpty && pages.length > 1) {
      pages.remove(pages.last);
    }
    notifyListeners();
  }

  /// 返回最上层
  void popLast() {
    debugPrint('${describeIdentity(this)}.poppopLast');
    if (pages.isNotEmpty && pages.length > 1) {
      pages.removeRange(1, pages.length);
    }
    notifyListeners();
  }

  /// 替换当前路由
  void replace({required String name, dynamic arguments}) {
    debugPrint('${describeIdentity(this)}.replace: $name');
    if (pages.isNotEmpty) {
      pages.removeLast();
    }
    push(name: name,arguments: arguments);
  }

  /// 获取最后页
  Page lastPage() {
    return pages.last;
  }

 @override
  Future<void> setNewRoutePath(List<RouteInfo> configuration) {
    return Future.value(null);
  }

  /// 物理按键返回路由 防止退出app
  @override
  Future<bool> popRoute() {
    if (canPop()) {
      pages.removeLast();
      debugPrint('${describeIdentity(this)}.popRoute: ');
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(true);
  }

  bool canPop() {
    return pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    debugPrint('${describeIdentity(this)}._onPopPage: $route');
    if (!route.didPop(result)) return false;

    if (canPop()) {
      pages.removeLast();
      return true;
    } else {
      return false;
    }
  }
}
