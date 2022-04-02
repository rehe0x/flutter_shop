import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/page/home/home.dart';

void main() {
  // if (Platform.isAndroid) {
  //     //去掉安卓透明状态栏 && 设置状态字体颜色
  //     SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark,
  //
  //     );
  //     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      theme: ThemeData(
        fontFamily: 'PingFangSC-Regular'
      ),
      home: MyCupertinoTabScaffold(),
    );
  }
}


class MyCupertinoTabScaffold extends StatelessWidget {
  final List tabs = [
    {'icon': CustomIcons.home, 'text': '首页'},
    {'icon': CustomIcons.service, 'text': '精选'},
    {'icon': CustomIcons.search, 'text': '搜索'},
    {'icon': CustomIcons.cart, 'text': '购物车'},
    {'icon': CustomIcons.people, 'text': '账户'}
  ];

  final List<Widget> pages = [
    Home('首页'),
    Home('精选'),
    Home('搜索'),
    Home('购物车'),
    Home('账户'),
  ];
  MyCupertinoTabScaffold({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.blueAccent,
          items: tabs.map((tab) => BottomNavigationBarItem(
              icon: Icon(tab['icon']),
              label: tab['text'])).toList(),
        ),
        tabBuilder: (BuildContext context, int index) {
          return pages[index];
        }
    );
  }
}
