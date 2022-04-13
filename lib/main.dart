import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/app_provider.dart';
// import 'package:flutter_shop/constant/theme.dart';
import 'package:flutter_shop/provider/navigation_bar.dart';
import 'package:flutter_shop/routes/delegate.dart';
import 'package:flutter_shop/routes/parser.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider())
      ],
      child: MyApp(),
    )
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key) {
      // delegate.push(name: 'index');
  }

  /// 放在外面创建 避免热加载出现
  /// The Navigator.pages must not be empty to use the Navigator.pages API
  final AppRouterDelegate appRouterDelegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      // themeMode: ThemeMode.light,
      // theme: AppTheme.of(context).getThemeData(),
      theme: ThemeData(
        backgroundColor: AppThemes.of(context).primaryBackgroundColor
        // primaryColor: AppThemes.of(context).primaryColor,
        // colorScheme: ThemeData().colorScheme.copyWith(
        //   primary: AppThemes.of(context).primaryColor,
        // ),
      ),
      routerDelegate: appRouterDelegate,
      routeInformationParser: const AppRouteParser(),
    );
  }
}
