import 'package:flutter/material.dart';

class RouteInfo {
  String? key;
  String name;
  Widget child;
  Object? arguments;

  RouteInfo({this.key, required this.name, required this.child, this.arguments});
}
