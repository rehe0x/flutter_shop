
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// 路由url处理
class AppRouteParser extends RouteInformationParser<List<RouteSettings>> {

  const AppRouteParser() : super();


  /// 路由初始入口 可以解析路由地址及参数 主要用于浏览器拼接路由url
  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) {

    final uri = Uri.parse(routeInformation.location!);
    debugPrint('parseRouteInformation: $uri');

    /// 默认斜杠/ 跳转到首页
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture([const RouteSettings(name: '/index')]);
    }

    final routeSettings = uri.pathSegments.map((path) => RouteSettings(
              name: '/$path',
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
  RouteInformation restoreRouteInformation(List<RouteSettings> configuration) {
    debugPrint('restoreRouteInformation: $configuration');
    if (configuration.isEmpty) {
      return const RouteInformation(location: '/');
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