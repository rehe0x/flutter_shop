import 'package:flutter/foundation.dart';
import 'package:flutter_shop/routes/routes_handle.dart';

class RouteInfo {

  final PagesEnum? pagesEnum;

  final Object? arguments;

  /// Creates data used to construct routes.
  const RouteInfo({
    this.pagesEnum,
    this.arguments,
  });

  /// Creates a copy of this route settings object with the given fields
  /// replaced with the new values.
  RouteInfo copyWith({
    PagesEnum? name,
    Object? arguments,
  }) {
    return RouteInfo(
      pagesEnum: pagesEnum ?? pagesEnum,
      arguments: arguments ?? this.arguments,
    );
  }


  @override
  String toString() => '${objectRuntimeType(this, 'RouteSettings')}("$pagesEnum", $arguments)';
}

