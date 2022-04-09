import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/index.dart';
import 'package:flutter_shop/routes/routes_stack.dart';

import '../page/test/test1.dart';

/// 路由代理
class AppRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with PopNavigatorRouterDelegateMixin<List<RouteSettings>>, ChangeNotifier {
// final List<Page<dynamic>> _pages = [];
  final List<Page<dynamic>> _pages = <Page<dynamic>>[
    _createPage(RouteSettings(name: '/index'))
  ];

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
      onPopPage: _onPopPage,
      pages: List.of(_pages)
    );
  }

// 初始化路由
  @override
  Future<void> setInitialRoutePath(List<RouteSettings> configuration) {
    debugPrint('setInitialRoutePath ${configuration.last.name}');
    return setNewRoutePath(configuration);
  }

 @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    debugPrint('setNewRoutePath ${configuration.last.name}');
    _setPath(configuration
        .map((routeSettings) => _createPage(routeSettings))
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
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
  }


  bool canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
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
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

   /// 返回
  void pop() {
    if (_pages.isNotEmpty) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name,arguments: arguments);
  }

  static CupertinoPage _createPage(RouteSettings routeSettings) {
    Widget child;

    switch (routeSettings.name) {
      case '/index':
        child = const AppIndex();
        break;
      // case '/splash':
      //   child = const Splash();
      //   break;
      case '/test1':
        child = const TestPage1();
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

  Future<bool> _confirmExit() async {
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

// class AppRouteParser extends RouteInformationParser<String> {
//   @override
//   Future<String> parseRouteInformation(RouteInformation routeInformation) {
//     debugPrint('parseRouteInformation');
//     return SynchronousFuture(routeInformation.location!);
//   }

//   @override
//   RouteInformation restoreRouteInformation(String configuration) {
//     debugPrint('restoreRouteInformation');
//     return RouteInformation(location: configuration);
//   }
// }



class AppRouteParser extends RouteInformationParser<List<RouteSettings>> {

  const AppRouteParser() : super();

  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) {

    final uri = Uri.parse(routeInformation.location!);
    debugPrint('parseRouteInformation=$uri');
    if (uri.pathSegments.isEmpty) {
      return Future.value([const RouteSettings(name: '/index')]);
    }

    final routeSettings = uri.pathSegments.map((path) => RouteSettings(
              name: '/$path',
              arguments: path == uri.pathSegments.last
                  ? uri.queryParameters
                  : null,
            ))
        .toList();

    return Future.value(routeSettings);
  }

  @override
  RouteInformation restoreRouteInformation(List<RouteSettings> configuration) {
    if (configuration.isEmpty) {
      return const RouteInformation(location: '/index');
    }
    final location = configuration.last.name;
    final arguments = _restoreArguments(configuration.last);

    return RouteInformation(location: '$location$arguments');
  }

  String _restoreArguments(RouteSettings routeSettings) {
    if (routeSettings.name != '/details') return '';
    var args = routeSettings.arguments as Map;

    return '?name=${args['name']}&imgUrl=${args['imgUrl']}';
  }
}