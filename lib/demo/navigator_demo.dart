import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/search/search.dart';

import '../constant/theme.dart';


class MyNavigatorDemo extends StatelessWidget {
  const MyNavigatorDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: AppTheme.themeData,
      routerDelegate: AppRouterDelegateDemo(),
      routeInformationParser: AppRouteParserDemo(),
      
    );
  }
}


class AppRouterDelegateDemo extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {

  // 路由栈
  List<Page<dynamic>> pages =  <Page<dynamic>>[];

  static AppRouterDelegateDemo of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    

    assert(delegate is AppRouterDelegateDemo, 'Delegate type must match');
    return delegate as AppRouterDelegateDemo;
  }

  // AppRouterDelegateDemo({
  //   required this.onGenerateRoute,
  // });
  // final RouteFactory onGenerateRoute;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  // List<String> get stack => List.unmodifiable(_stack);


  /// 添加路由
  void push(Page newRoute) {
    pages.add(newRoute);
    notifyListeners();
  }

  /// 返回
  void pop() {
    if (pages.isNotEmpty) {
      pages.remove(pages.last);
    }
    notifyListeners();
  }

  // 初始化路由
  @override
  Future<void> setInitialRoutePath(String configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    print('setNewRoutePath');
    pages
      ..clear()
      ..add(CupertinoPage(
            key: const ValueKey('main'),
            name: 'main', 
            child: PageDemo(),
          ),);
    // return SynchronousFuture<void>();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (pages.isNotEmpty) {
      pages.remove(pages.last);
    }
    print('_onPopPage');
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('${describeIdentity(this)}.stack1: $pages');
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(pages),
    );
  }
}


class AppRouteParserDemo extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    print('parseRouteInformation');
    return SynchronousFuture(routeInformation.location!);
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    print('restoreRouteInformation');
    return RouteInformation(location: configuration);
  }
}
