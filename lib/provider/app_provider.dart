import 'package:flutter/material.dart';
import '../theme/themes.dart';

/// 一些app全局主题

/// 主题通知
class AppThemeProvider extends ChangeNotifier {
  /// 默认主题
  ThemeEnum _themeEnum = ThemeEnum.main;

  /// 获取主题
  ThemeEnum get themeEnum => _themeEnum;

  /// 修改主题
  updateTheme(ThemeEnum themeEnum){
    _themeEnum = themeEnum;
    notifyListeners();
  }

}