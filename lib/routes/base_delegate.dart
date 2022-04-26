import 'package:flutter/cupertino.dart';

class RouteBaseDelegate {

  static T? of<T>(BuildContext context){
    T? routeDelegate;
    int i = 0;
    void visit(BuildContext element){
      final delegate = Router.maybeOf(element)?.routerDelegate;
      i++;
      if (delegate != null && delegate is T) {
        debugPrint('routeDelegate=$i=$delegate');
        routeDelegate =  delegate as T;
      } else {
        element.visitChildElements(visit);
      }
    }
    
    final delegate = Router.maybeOf(context)?.routerDelegate;
    if (delegate != null && delegate is T) {
      return delegate as T;
    }

    NavigatorState? navigatorState = context.findRootAncestorStateOfType<NavigatorState>();
    visit(navigatorState!.context);
    // assert(routeDelegate != null, 'No RouterDelegate');
    return routeDelegate;
  }
  
}