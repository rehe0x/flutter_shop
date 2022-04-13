import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/themes.dart';

class AppThemeProvider extends ChangeNotifier {
 ThemeEnum _themeEnum = ThemeEnum.main;
  // CustomTheme? customTheme =  AppTheme.themes[ThemeEnum.main];
 ThemeEnum get themeEnum => _themeEnum;
  updateTheme(ThemeEnum themeEnum){
    print(themeEnum);
    _themeEnum = themeEnum;
    notifyListeners();
  }

}