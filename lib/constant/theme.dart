
import 'package:flutter/material.dart';

class MyThemeData {
  // 主题颜色 tabbar 按钮等颜色
  static const Color primaryColor = Color.fromARGB(255, 12, 65, 135);

  // 主题背景色 
  static const Color primaryBackgroundColor = Color.fromARGB(255, 255, 255, 255);
  // 副背景色
  static const Color primarySubBackgroundColor = Color.fromARGB(255, 245, 245, 245);

   // 字体颜色
  static const Color primaryTextColor = Color.fromARGB(255, 30, 30, 30);
  // 副字体颜色
  static const Color primarySubTextColor = Color.fromARGB(255, 95, 95, 95);

  // 未选中禁止颜色颜色
  static const Color primaryDisabledColor = Color.fromARGB(255, 145, 145, 145);

  // icon颜色
  static const Color primaryIconColor = Color.fromARGB(255, 30, 30, 30);

  static ThemeData themeData = ThemeData(
    fontFamily: 'PingFangSC-Regular',
    primaryColor: primaryColor,
    primaryTextTheme: const TextTheme(
      subtitle1: TextStyle(
        color: primaryTextColor,
        decoration: TextDecoration.none,
      )
    ),
    primaryIconTheme: const IconThemeData(
      color: primaryIconColor
    ),
    scaffoldBackgroundColor: primaryBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: primaryBackgroundColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: primaryTextColor,
        fontSize: 24,
      )
    )
    
  );
}