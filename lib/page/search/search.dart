import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/theme.dart';
import 'package:provider/provider.dart';

import '../../provider/navigation_bar.dart';
import '../../widget/search_field.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}
 
class MainPageState extends State<MainPage> {
  int currentIndex = 0;       //底部导航栏索引
  final List<Widget> children = [
    HomePage(),          //首页
    MinePage(),           //我的
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
 
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'first',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder =  (BuildContext context) => FirstPage();
        switch (settings.name) {
          case 'first':
            builder = (BuildContext context) => FirstPage();
            break;
          case 'second':
            builder = (BuildContext context) => SecondPage();
            break;
        }
        return  MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class MinePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // MaterialPage
    return Navigator(
      pages: [],
      initialRoute: 'second',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder =  (BuildContext context) => FirstPage();
        switch (settings.name) {
          case 'first':
            builder = (BuildContext context) => FirstPage();
            break;
          case 'second':
            builder = (BuildContext context) => SecondPage();
            break;
        }
        // settings.
        return  MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('第一个页面'),
      // ),
      body: Center(
        child: RaisedButton(
            child: Text('跳转到第二个页面'),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage()))),
      ),
    );
  }
}
 
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('第二个页面'),
      // ),
      body: Center(
        child: RaisedButton(
            child: Text('返回上一个页面'),
 onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}


class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchField(height: 40, autofocus: true),
      ),
      body: _SearchPageRoute()
    );
  }
}


class _SearchPageRoute extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'search',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'search':
            builder = (BuildContext context) => const _MyCustomScrollView();
            break;
          case 'goods_item':
            builder = (BuildContext context) => const _MyCustomScrollView2();
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

class _MyCustomScrollView extends StatelessWidget {
  const _MyCustomScrollView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     NavigationBarProvider navigationBarProvider = Provider.of<NavigationBarProvider>(context, listen: false);
// navigationBarProvider.focusNode.requestFocus();
    return Scaffold(
      body: ListView(
          // padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
          children: [
            const Text('历史搜索', style: AppStyle.title1Style,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 3,//宽高比3:1
              ),
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast)
              ],
            ),
            const Text('热搜商品', style: AppStyle.title1Style,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 3,//宽高比3:1
              ),
              children:  [
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
                InkWell(
                  child: Text('ceshi'),
                  onTap: (){
                    Navigator.pushNamed(context, 'goods_item');
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const _MyCustomScrollView2()));
                  },
                )
              ],
            )
          ],
        ),
    );
  }
}



class _MyCustomScrollView2 extends StatelessWidget {
  const _MyCustomScrollView2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          // padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
          children: [
            const Text('第二页', style: AppStyle.title1Style,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 3,//宽高比3:1
              ),
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast)
              ],
            ),
            const Text('热搜商品', style: AppStyle.title1Style,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 3,//宽高比3:1
              ),
              children:  [
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
                InkWell(
                  child: Text('ceshi2'),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const _MyCustomScrollViewTest()));
                  },
                )
              ],
            )
          ],
        ),
    );
  }
}



