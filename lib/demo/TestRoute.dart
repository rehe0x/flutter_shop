


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../../constant/custom_icons.dart';
// import '../../constant/theme.dart';

// class MyApply extends StatelessWidget {
//   const MyApply({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Test',
//       theme: AppTheme.themeData,
//       home:   MyRoutes(),
//       // routes: ,
      
//     );
//   }
// }


// // class MyApply extends StatelessWidget {
// //    MyApply({ Key? key }) : super(key: key);
// //  final delegate = MyMainDelegate(
// //     onGenerateRoute: (RouteSettings settings) {
// //       print('进来了');
// //       return MaterialPageRoute(
// //         settings: settings,
// //         builder: (BuildContext context) {
// //           return  _MyCupertinoTabScaffold();
// //         },
// //       );
// //     },);
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp.router(
      
// //       routerDelegate: delegate,
// //       routeInformationParser: MyRouteParser2(),
// //     );
// //   }
// // }


// class MyRoutes extends StatelessWidget {
//    MyRoutes({ Key? key }) : super(key: key);

//   final delegate = MyMainDelegate(
//     onGenerateRoute: (RouteSettings settings) {
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (BuildContext context) {
//           return  _MyCupertinoTabScaffold();
//         },
//       );
//     },
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Router(
//       routerDelegate: NestedAppRouterDelegate(),
//       routeInformationParser: MyRouteParser2(),
//     );
//   }
// }


// class MyRouteParser2 extends RouteInformationParser<String> {
//   @override
//   Future<String> parseRouteInformation(RouteInformation routeInformation) {
//     print('ceshi222');
//     return SynchronousFuture(routeInformation.location!);
//   }

//   @override
//   RouteInformation restoreRouteInformation(String configuration) {
//     print('ceshi3');
//     return RouteInformation(location: configuration);
//   }
// }

// class MyMainDelegate extends RouterDelegate<String>
//     with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {

//   final _stack = <String>[];
  

//   static MyMainDelegate of(BuildContext context) {
//     final delegate = Router.of(context).routerDelegate;
//     assert(delegate is MyMainDelegate, 'Delegate type must match');
//     return delegate as MyMainDelegate;
//   }

//   MyMainDelegate({
//     required this.onGenerateRoute,
//   });

//   final RouteFactory onGenerateRoute;

//   @override
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

//   List<String> get stack => List.unmodifiable(_stack);


//   void push(String newRoute) {
//     _stack.add(newRoute);
//     notifyListeners();
//   }

//   void pop() {
//     if (_stack.isNotEmpty) {
//       _stack.remove(_stack.last);
//     }
//     notifyListeners();
//   }

//   void remove(String routeName) {
//     _stack.remove(routeName);
//     notifyListeners();
//   }

//   // 初始化路由
//   @override
//   Future<void> setInitialRoutePath(String configuration) {
//     print(configuration);
//     return setNewRoutePath(configuration);
//   }

//   @override
//   Future<void> setNewRoutePath(String configuration) {
//     _stack
//       ..clear()
//       ..add(configuration);
//     return SynchronousFuture<void>(null);
//   }

//   bool _onPopPage(Route<dynamic> route, dynamic result) {
//     if (_stack.isNotEmpty) {
//       if (_stack.last == route.settings.name) {
//         _stack.remove(route.settings.name);
//         notifyListeners();
//       }
//     }
//     return route.didPop(result);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('${describeIdentity(this)}.stack1: $_stack');
//     return Navigator(
//       key: navigatorKey,
//       onPopPage: _onPopPage,
//       pages: [
//         for (final name in _stack)
//           CupertinoPage(
//             key: ValueKey(name),
//             name: name, 
//             child: _MyCupertinoTabScaffold(),
//           ),
//       ],
//     );
//   }
// }


// /// 使用ios风格底部tab脚手架
// class _MyCupertinoTabScaffold extends StatelessWidget {
//   static final  List _tabs = [
//     {'icon': CustomIcons.home, 'text': '首页'},
//     {'icon': CustomIcons.service, 'text': '精选'},
//     {'icon': CustomIcons.search, 'text': '搜索'},
//     {'icon': CustomIcons.cart, 'text': '购物车'},
//     {'icon': CustomIcons.people, 'text': '账户'}
//   ];

//   /// 底部菜单对应页面
//   static final List<Widget> _pages = [
//     const HomeTest(title: '首页',),
//     const HomeTest(title: '精选'),
//     const HomeTest(title: '搜索'),
//     const HomeTest(title: '购物车'),
//     const HomeTest(title: '账户'),
//   ];
  



//   const _MyCupertinoTabScaffold({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//           activeColor: Theme.of(context).primaryColor,
//           items: _tabs.map((tab) => BottomNavigationBarItem(
//               icon: Icon(tab['icon']),
//               label: tab['text'])).toList(),
//           onTap: (int index){
//             // print(cupertinoTabController);
//           },
//         ),
//         tabBuilder: (BuildContext context, int index) {
//           return _pages[index];
//         }
//     );
//   }
// }





// class HomeTest extends StatelessWidget {
//   const HomeTest({ Key? key,required this.title }) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: Text(title),
//         ),
//     );
//   }
// }