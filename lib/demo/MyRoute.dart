import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyRouteApp extends StatefulWidget {
  const MyRouteApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyRouteApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: MyRouteParser(),
      routerDelegate: MyRouteDelegate(),
    );
  }
}

class MyRouteParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation.location!);
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}

class MyRouteDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  final _stack = <String>[];
  List<Page<dynamic>> pages =  [];

  static MyRouteDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is MyRouteDelegate, 'Delegate type must match');
    return delegate as MyRouteDelegate;
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  // List<String> get stack => List.unmodifiable(_stack);

  void push(String newRoute) {
    _stack.add(newRoute);
   
    
    pages.add(
      CupertinoPage(
            key: ValueKey(newRoute),
            name: newRoute, child: MyHomePage(title: 'Route: ${newRoute}'),
          )
    );
    notifyListeners();
  }

  void remove(String routeName) {
    _stack.remove(routeName);
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(String configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    _stack
      ..clear()
      ..add(configuration);
       pages.add(
      CupertinoPage(
            key: ValueKey("0"),
            name: "0", child: MyHomePage(title: 'Route: ${0}'),
          )
    );
    return SynchronousFuture<void>(null);
  }

  // bool _onPopPage(Route<dynamic> route, dynamic result) {
  //   if (_stack.isNotEmpty) {
  //     if (_stack.last == route.settings.name) {
  //       _stack.remove(route.settings.name);
  //       notifyListeners();
  //     }
  //   }
  //   return route.didPop(result);
  // }

  @override
  Widget build(BuildContext context) {
     List<Page<dynamic>> pages1 =  [];

    // for (final name in _stack){
    
    // }
        // pages = pages1;

    print('${describeIdentity(this)}.stack1: $_stack');
    return Navigator(
      // key: navigatorKey,
      // onPopPage: _onPopPage,
      // pages: [
      //   for (final name in _stack)
      //     CupertinoPage(
      //       key: ValueKey(name),
      //       name: name, child: MyHomePage(title: 'Route: ${name}'),
      //     ),
      // ],
      pages: List.of(pages),
    );
  }
}

// class MyPage extends Page {
//   const MyPage({
//     required LocalKey key,
//     required String name,
//   }) : super(
//     key: key,
//     name: name,
//   );

//   Route createRoute(BuildContext context) {
//     return MaterialPageRoute(
//       settings: this,
//       builder: (BuildContext context) {
//         return MyHomePage(title: 'Route: ${name}');
//       },
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int _counter = 0;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Is this being displayed?'),
          actions: [
            TextButton(
              onPressed: (){
                print('点击no');
                    Navigator.of(context).pop();
              },
              
              child: Text('NO'),
            ),
            TextButton(
              onPressed: (){
                print('点击yes');
                Navigator.of(context).pop(true);
              },
              child: Text('YES'),
            ),
          ],
        );
      },
    );
  }

  void _removeLast() {
    final delegate = MyRouteDelegate.of(context);
    final stack = delegate._stack;
    if (stack.length > 1) {
      delegate.remove(stack[stack.length - 1]);
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('创建路由');
    MyRouteDelegate.of(context).push('Route$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'dialog',
            onPressed: _showDialog,
            tooltip: 'Show dialog',
            child: Icon(Icons.message),
          ),
          SizedBox(width: 12.0),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: _removeLast,
            tooltip: 'Remove last',
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 12.0),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}