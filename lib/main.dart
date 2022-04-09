import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/constant/theme.dart';
import 'package:flutter_shop/page/home/home.dart';
import 'package:flutter_shop/page/search/MyRoute.dart';
import 'package:flutter_shop/page/search/TestRoute.dart';
import 'package:flutter_shop/page/search/search.dart';
import 'package:flutter_shop/page/search/test.dart';
import 'package:flutter_shop/page/search/test2.dart';
import 'package:flutter_shop/page/search/test3.dart';
import 'package:flutter_shop/provider/navigation_bar.dart';
import 'package:flutter_shop/routes/ceshil.dart';
import 'package:flutter_shop/routes/navigator2.dart';
import 'package:flutter_shop/routes/navigator_demo.dart';
import 'package:provider/provider.dart';

AppRouterDelegate delegate = AppRouterDelegate();

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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationBarProvider())
      ],
      child: MyApp(),
      // child: NestedRouterDemo(),
    )
  );
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key) {
      // delegate.push(name: 'index');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      theme: AppTheme.themeData,
      routerDelegate: delegate,
      routeInformationParser: AppRouteParser(),
    );
  }
}
