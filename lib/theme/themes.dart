import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'themes_constant.dart';
import 'custom_theme.dart';
import '../provider/app_provider.dart';


/// 主题
class AppThemes {

  // static CustomTheme themeData = ThemeConstant.main;

  /// 主题配置表
  static final Map<ThemeEnum, CustomTheme> _themes = {
    ThemeEnum.main: ThemeConstant.main,
    ThemeEnum.dark: ThemeConstant.dark
  };
  
  /// 获取全局主题对象 问题 调用次数太多 改用静态变量 不行
  static CustomTheme of(BuildContext context){
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context, listen: true);
    debugPrint('CustomTheme.of: ${appThemeProvider.themeEnum.name}');
    // themeData = _themes[appThemeProvider.themeEnum]!;
    return _themes[appThemeProvider.themeEnum]!;
  }
  
  /// 改变主题
  static void change(BuildContext context, ThemeEnum themeEnum){
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context, listen: false);
    appThemeProvider.updateTheme(ThemeEnum.dark == appThemeProvider.themeEnum ? ThemeEnum.main : ThemeEnum.dark);
  }

}

enum ThemeEnum{
  main,
  dark
}
