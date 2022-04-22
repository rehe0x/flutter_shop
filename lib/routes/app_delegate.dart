import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop/routes/routes_model.dart';

import 'routes_handle.dart';

/// app顶层路由
class AppRouterDelegate extends RouterDelegate<List<RouteInfo>>
    with PopNavigatorRouterDelegateMixin<List<RouteInfo>>, ChangeNotifier {
  
  /// 路由列表
  final List<Page<dynamic>> _pages = [];

  /// 获取路由代理对象
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
  List<RouteInfo> get currentConfiguration {
    debugPrint('currentConfiguration');
    return _pages
        .map((page) => RouteInfo(pagesEnum: PagesEnum.values.byName(page.name!) ,arguments: page.arguments))
        .toList();
  }

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
  Future<void> setInitialRoutePath(List<RouteInfo> configuration) {
    debugPrint('setInitialRoutePath: ${configuration.last.pagesEnum}');
    return setNewRoutePath(configuration);
  }

 @override
  Future<void> setNewRoutePath(List<RouteInfo> configuration) {
    _setPath(configuration
        .map((routeInfo) => RouteHandle.createPage(routeInfo))
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

  /// 物理按键返回路由 防止退出app
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
    // route.settings
    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  // 添加路由
  void push({required PagesEnum pagesEnum, dynamic arguments}) {
     debugPrint('push: $pagesEnum');
    _pages.add(RouteHandle.createPage(RouteInfo(pagesEnum: pagesEnum, arguments: arguments)));
    notifyListeners();
  }

   /// 返回上层
  void pop() {
    debugPrint('pop');
    if (_pages.isNotEmpty) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  /// 替换当前路由
  void replace({required PagesEnum pagesEnum, dynamic arguments}) {
    debugPrint('replace: $pagesEnum');
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(pagesEnum: pagesEnum,arguments: arguments);
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



/// 路由url处理
class AppRouteParser extends RouteInformationParser<List<RouteInfo>> {

  const AppRouteParser() : super();


  /// 路由初始入口 可以解析路由地址及参数 主要用于浏览器拼接路由url
  @override
  Future<List<RouteInfo>> parseRouteInformation(
      RouteInformation routeInformation) {

    final uri = Uri.parse(routeInformation.location!);
    debugPrint('parseRouteInformation: $uri');

    /// 默认斜杠/ 跳转到首页
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture([const RouteInfo(pagesEnum: PagesEnum.indexs)]);
    }
    
    final routeSettings = uri.pathSegments.map((path) => RouteInfo(
              pagesEnum: PagesEnum.values.byName(path),
              arguments: path == uri.pathSegments.last
                  ? uri.queryParameters
                  : null,
            ))
        .toList();

    /// SynchronousFuture使用同步初始化
    return SynchronousFuture(routeSettings);
  }

  /// 路由返回 可解析路由地址及参数 主要用于浏览器url、参数
  @override
  RouteInformation restoreRouteInformation(List<RouteInfo> configuration) {
    debugPrint('restoreRouteInformation: $configuration');
    if (configuration.isEmpty) {
      return const RouteInformation(location: '/');
    }
    final location = configuration.last.pagesEnum;
    final arguments = _restoreArguments(configuration.last);

    return RouteInformation(location: '$location$arguments');
  }

  String _restoreArguments(RouteInfo routeInfo) {
    if (routeInfo.pagesEnum != PagesEnum.goodsDetail) return '';
    var args = routeInfo.arguments as Map;

    return '?name=${args['name']}&imgUrl=${args['imgUrl']}';
  }
}