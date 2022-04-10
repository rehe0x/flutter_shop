import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/handle.dart';

/// 路由代理
class AppRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with PopNavigatorRouterDelegateMixin<List<RouteSettings>>, ChangeNotifier {
  
  final List<Page<dynamic>> _pages = [];

  static AppRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is AppRouterDelegate, 'Delegate type must match');
    return delegate as AppRouterDelegate;
  }

  // AppRouterDelegate({
  //   required this.onGenerateRoute,
  // });
  // final RouteFactory onGenerateRoute;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  @override
  Widget build(BuildContext context) {
    debugPrint('${describeIdentity(this)}._pages: $_pages');
    return Navigator(
      key: navigatorKey,
      // onGenerateRoute: (RouteSettings settings) {
      //   debugPrint('onGenerateRoute: $settings');
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (BuildContext context) {
      //       return const AppIndex();
      //     },
      //   );
      // },
      onPopPage: _onPopPage,
      pages: List.of(_pages)
    );
  }

// 初始化路由
  @override
  Future<void> setInitialRoutePath(List<RouteSettings> configuration) {
    debugPrint('setInitialRoutePath: ${configuration.last.name}');
    return setNewRoutePath(configuration);
  }

 @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    _setPath(configuration
        .map((routeSettings) => RouteHandle.createPage(routeSettings))
        .toList());
    return Future.value(null);
  }

  void _setPath(List<Page> pages) {
    _pages.clear();
    _pages.addAll(pages);

    if (_pages.first.name != '/') {
      // _pages.insert(0, _createPage(const RouteSettings(name: '/')));
    }
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      debugPrint('popRoute: ');
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
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

  // 添加
  void push({required String name, dynamic arguments}) {
     debugPrint('push: $name');
    _pages.add(RouteHandle.createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

   /// 返回
  void pop() {
    debugPrint('pop');
    if (_pages.isNotEmpty) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  void replace({required String name, dynamic arguments}) {
    debugPrint('replace: $name');
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name,arguments: arguments);
  }

  Future<bool> _confirmExit() async {
    debugPrint('_confirmExit');
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: const Text('确定要退出App吗?'),
            actions: [
              TextButton(
                child: const Text('取消'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('确定'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        });
    return result ?? true;
  }
}