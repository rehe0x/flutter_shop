import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class PageDemo extends StatefulWidget {
  const PageDemo({ Key? key }) : super(key: key);

  @override
  State<PageDemo> createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(backgroundColor: Colors.red,icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(backgroundColor: Colors.red,icon: Icon(Icons.search), label: '搜索'),
          BottomNavigationBarItem(backgroundColor: Colors.red,icon: Icon(Icons.account_balance), label: '测试'),
          BottomNavigationBarItem(backgroundColor: Colors.red,icon: Icon(Icons.delete), label: '开始')
        ],
      ),
      body: Router(
              // routeInformationParser: AppRouteParserDemoSub(),
              routerDelegate: AppRouterDelegateDemoSub(),)
      // body: _SearchPageRoutesub(),
    
    );
  }
}



class _SearchPageRoutesub extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'pageBody',
      onGenerateRoute: (RouteSettings settings) {
        print('测试lllll');
        WidgetBuilder builder;
        switch (settings.name) {
          case 'pageBody':
            builder = (BuildContext context) => const pageBody();
            break;
          case 'goods_item':
            builder = (BuildContext context) => const pageBody();
            break;
          default:
            builder = (BuildContext context) => const Text('404');
            break;
        }
        
        return  CupertinoPageRoute(builder: builder, settings: settings);
      },
    );
  }
}


class pageBody extends StatelessWidget {
  const pageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton.filled(
              child: Text('首页'),
              onPressed: (){
              //  AppRouterDelegateDemo().push(  CupertinoPage(
              //       key: const ValueKey('page1'),
              //       name: 'page1', 
              //       child: PageDemo1(),
              //     ));
                AppRouterDelegateDemo.of(context).push(
                  CupertinoPage(
                    key: const ValueKey('page1'),
                    name: 'page1', 
                    child: PageDemo1(),
                  )
                );
                 // Navigator.of(context).push(
                //   CupertinoPageRoute(
                //     // key: const ValueKey('page1'),
                //     // name: 'page1', 
                   
                //     builder: (BuildContext context) { 
                //         return  PageDemo1();
                //      },
                //   )
                // );
              }
            ),
            CupertinoButton.filled(
              child: Text('内部跳转'),
              onPressed: (){

                AppRouterDelegateDemoSub.of(context).push(
                  CupertinoPage(child: PageDemo1())
                );
                // Navigator.of(context).push(
                //   CupertinoPageRoute(
                //     // key: const ValueKey('page1'),
                //     // name: 'page1', 
                   
                //     builder: (BuildContext context) { 
                //         return  PageDemo1();
                //      },
                //   )
                // );
              }
            )
          ],
        ),
      );
  }
}



class AppRouterDelegateDemoSub extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {

  // 路由栈
  List<Page<dynamic>> pages =  <Page<dynamic>>[];

  static AppRouterDelegateDemoSub of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is AppRouterDelegateDemoSub, 'Delegate type must match');
    return delegate as AppRouterDelegateDemoSub;
  }

  // AppRouterDelegateDemoSub({
  //   required this.onGenerateRoute,
  // });
  // final RouteFactory onGenerateRoute;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  // List<String> get stack => List.unmodifiable(_stack);


  /// 添加路由
  void push(Page newRoute) {
    pages.add(newRoute);
    notifyListeners();
  }

  /// 返回
  void pop() {
    if (pages.isNotEmpty) {
      pages.remove(pages.last);
    }
    notifyListeners();
  }

  // 初始化路由
  @override
  Future<void> setInitialRoutePath(String configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    print('setNewRoutePath1111');
    pages
      ..clear()
      ..add(CupertinoPage(
            key: const ValueKey('mainsu'),
            name: 'mainsu', 
            child: pageBody(),
          ),);
    // return SynchronousFuture<void>();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (pages.isNotEmpty) {
      pages.remove(pages.last);
    }
    print('_onPopPage');
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('slsdlfdksfjskdlf');
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
                      return MaterialPageRoute(
                        settings: settings,
                        builder: (BuildContext context) {
                    return pageBody();
                  },
                );
              },
      onPopPage: _onPopPage,
      pages: List.of(pages),
    );
  }
}


class AppRouteParserDemoSub extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    print('parseRouteInformation');
    return SynchronousFuture(routeInformation.location!);
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    print('restoreRouteInformation');
    return RouteInformation(location: configuration);
  }
}
