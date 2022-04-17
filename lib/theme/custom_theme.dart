

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义主题模型
class CustomTheme {
  /// 主题颜色 选中/按钮 
  final Color primaryColor;

  /// 主题背景色 整个屏幕背景
  final Color primaryBackgroundColor;

  /// 主题前景色 一般头部尾部
  final Color primaryAccentColor;

  ///  scaffold脚手架 背景色
  final Color scaffoldBackgroundColor;

  /// 脚手架前景色 一般屏幕body
  final Color scaffoldAccentColor;

  ///  底部导航默认颜色
  final Color bottomAppBarColor;

  /// 字体主题颜色 
  final Color primaryTextColor;

   /// 提示字体
  final Color labelTextColor;

  /// icon主题色
  final Color primaryIconColor;

  /// 提示占位
  final Color labelIconColor;
  
  /// 文本样式标题 副文本
  final CustomTextTheme textTheme;

  /// 按钮文本样式
  final  CustomButtonTextTheme buttonTextTheme;
  
  factory CustomTheme({
    required Color primaryColor,
    required Color primaryBackgroundColor,
    required Color primaryAccentColor,
    required Color scaffoldBackgroundColor,
    required Color scaffoldAccentColor,
    required Color bottomAppBarColor,
    required Color primaryTextColor,
    required Color labelTextColor,
    required Color primaryIconColor,
    required Color labelIconColor,
    required CustomTextTheme textTheme,
    required CustomButtonTextTheme buttonTextTheme,
  }) {

    CustomTextTheme _textTheme = CustomTextTheme(
      titleLarge: textTheme.titleLarge.copyWith(
        color: primaryTextColor
      ),
      titleMedium: textTheme.titleMedium.copyWith(
        color: primaryTextColor
      ),
      titleSmall: textTheme.titleSmall.copyWith(
        color: primaryTextColor
      ),
      labelLarge: textTheme.labelLarge.copyWith(
        color: primaryTextColor
      ),
      labelMedium: textTheme.labelMedium.copyWith(
        color: primaryTextColor
      ),
      labelSmall: textTheme.labelSmall.copyWith(
        color: primaryTextColor
      ),
      
      displayLarge: textTheme.displayLarge.copyWith(
        color: labelTextColor
      ),
      displayMedium: textTheme.displayMedium.copyWith(
        color: labelTextColor
      ),
      displaySmall: textTheme.displaySmall.copyWith(
        color: labelTextColor
      ),

    );

    CustomButtonTextTheme _buttonTextTheme = CustomButtonTextTheme(
      buttonLarge: buttonTextTheme.buttonLarge.copyWith(
        color: primaryColor
      ),
      buttonMedium: buttonTextTheme.buttonMedium.copyWith(
        color: primaryColor
      ),
      buttonSmall: buttonTextTheme.buttonSmall.copyWith(
        color: primaryColor
      ),
    );

    return CustomTheme.raw(
      primaryColor: primaryColor,
      primaryBackgroundColor: primaryBackgroundColor,
      primaryAccentColor: primaryAccentColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      scaffoldAccentColor: scaffoldAccentColor,
      bottomAppBarColor: bottomAppBarColor,
      primaryTextColor: primaryTextColor,
      labelTextColor: labelTextColor,
      primaryIconColor: primaryIconColor,
      labelIconColor: labelIconColor,
      textTheme: _textTheme,
      buttonTextTheme: _buttonTextTheme
    );
  }

  const CustomTheme.raw({
    required this.primaryColor,
    required this.primaryBackgroundColor,
    required this.primaryAccentColor,
    required this.scaffoldBackgroundColor,
    required this.scaffoldAccentColor, 
    required this.bottomAppBarColor, 
    required this.primaryTextColor, 
    required this.labelTextColor, 
    required this.primaryIconColor, 
    required this.labelIconColor,
    required this.textTheme,
    required this.buttonTextTheme
  });
}

/// 主题色大中小标题 标准体
/// 副色大中小题 细体
class CustomTextTheme {
  /// 粗体
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  /// 细体
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  /// 副色
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  const CustomTextTheme({
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
  
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,

    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
  });
}

/// 文本按钮大中小标题 主题色
class CustomButtonTextTheme {
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;

  const CustomButtonTextTheme({
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
  });
}


/// 背景按钮大中小标题 主题色
// class CustomButtonFilledTheme {
//   final TextStyle buttonLarge;
//   final TextStyle buttonMedium;
//   final TextStyle buttonSmall;
// }


