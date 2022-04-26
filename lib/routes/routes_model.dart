import 'package:flutter/foundation.dart';

class RouteInfo {

  final String name;

  final Object? arguments;

  /// Creates data used to construct routes.
  const RouteInfo({
    required this.name,
    this.arguments,
  });


  @override
  String toString() => '${objectRuntimeType(this, 'RouteSettings')}("$name", $arguments)';
}

