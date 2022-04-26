import 'package:flutter/cupertino.dart';

class RouteBaseDelegate {

  static T? of<T>(BuildContext context){
    T? routeDelegate;
    int i = 0;

    /// 先查询当前路由是否匹配
    final delegate = Router.maybeOf(context)?.routerDelegate;
    if (delegate != null && delegate is T) {
      return delegate as T;
    }

    /// 向上遍历树
    context.visitAncestorElements((element) {
      final delegate = Router.maybeOf(element)?.routerDelegate;
      if (delegate != null && delegate is T) {
        routeDelegate =  delegate as T;
        debugPrint('routeDelegateAncestor=$delegate');
        return false;
      }
      return true;
    });

    /// 如果上面没有就向下遍历
    if (routeDelegate != null) {
      return routeDelegate;
    }

    /// 向下遍历树
    void visit(BuildContext element){
      final delegate = Router.maybeOf(element)?.routerDelegate;
      i++;
      if (delegate != null && delegate is T) {
        debugPrint('routeDelegateVisit=$i=$delegate');
        routeDelegate =  delegate as T;
      } else {
        element.visitChildElements(visit);
      }
    }
    NavigatorState? navigatorState = context.findAncestorStateOfType<NavigatorState>();
    visit(navigatorState!.context);
    // assert(routeDelegate != null, 'No RouterDelegate');
    return routeDelegate;
  }
  
}