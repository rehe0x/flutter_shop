import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';
import 'routes/app_delegate.dart';


void main() async{
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
        ChangeNotifierProvider(create: (context) => AppThemeProvider())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

  /// 顶层路由代理 放在外面创建 避免热加载出现
  /// The Navigator.pages must not be empty to use the Navigator.pages API
  final AppRouterDelegate appRouterDelegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      theme: ThemeData(
      // splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
      // highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
    ),
      routerDelegate: appRouterDelegate,
      routeInformationParser: const AppRouteParser(),
    );
  }
}
