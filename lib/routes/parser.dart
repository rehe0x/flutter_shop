
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteParser extends RouteInformationParser<List<RouteSettings>> {

  const AppRouteParser() : super();

  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) {

    final uri = Uri.parse(routeInformation.location!);
    debugPrint('parseRouteInformation: $uri');
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