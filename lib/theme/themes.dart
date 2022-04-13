import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/themes_constant.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';
import 'custom_theme.dart';

class AppThemes {

  static final Map<ThemeEnum, CustomTheme> _themes = {
    ThemeEnum.main: ThemeConstant.main,
    ThemeEnum.dark: ThemeConstant.dark
  };
  
  static CustomTheme of(BuildContext context){
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context, listen: true);
    print(appThemeProvider.themeEnum);
    return _themes[appThemeProvider.themeEnum]!;
    return ThemeConstant.dark;
  }

  static void change(BuildContext context, ThemeEnum themeEnum){
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context, listen: false);
    appThemeProvider.updateTheme(ThemeEnum.dark == appThemeProvider.themeEnum ? ThemeEnum.main : ThemeEnum.dark);
  }

}

enum ThemeEnum{
  main,
  dark
}
