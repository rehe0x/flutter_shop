
import 'package:flutter/material.dart';
import 'custom_theme.dart';

/// 主题配置
class ThemeConstant{

  static CustomTheme main = CustomTheme(
          primaryColor: const Color.fromARGB(255, 12, 65, 135), 
          primaryBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          primaryAccentColor: const Color.fromARGB(255, 245, 245, 245),  
          scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250), 
          scaffoldAccentColor: const Color.fromARGB(255, 235, 235, 235), 
          bottomAppBarColor: const Color.fromARGB(255, 145, 145, 145), 
          primaryTextColor: const Color.fromARGB(255, 30, 30, 30), 
          labelTextColor: const Color.fromARGB(255, 145, 145, 145), 
          primaryIconColor: const Color.fromARGB(255, 30, 30, 30), 
          labelIconColor: const Color.fromARGB(255, 145, 145, 145), 
          textTheme: const CustomTextTheme(
            titleLarge: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 24),
            titleMedium: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 18),
            titleSmall: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 14),
            labelLarge: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 18),
            labelMedium: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 14),
            labelSmall: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 12),            
          ),
          buttonTextTheme: const CustomButtonTextTheme(
            buttonLarge: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 18),
            buttonMedium: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 16),
            buttonSmall: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 14)         
          )
        );

  
  static CustomTheme dark = CustomTheme(
          primaryColor: const Color.fromARGB(255, 192, 247, 211), 
          primaryBackgroundColor: const Color.fromARGB(255, 10, 10, 10),
          primaryAccentColor: const Color.fromARGB(255, 25, 25, 25),  
          scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20), 
          scaffoldAccentColor: const Color.fromARGB(255, 40, 40, 40), 
          bottomAppBarColor: const Color.fromARGB(255, 160, 160, 160), 
          primaryTextColor: const Color.fromARGB(255, 225, 225, 225), 
          labelTextColor: const Color.fromARGB(255, 160, 160, 160), 
          primaryIconColor: const Color.fromARGB(255, 225, 225, 225), 
          labelIconColor: const Color.fromARGB(255, 160, 160, 160), 
          textTheme: const CustomTextTheme(
            titleLarge: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 24),
            titleMedium: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 18),
            titleSmall: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 14),
            labelLarge: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 18),
            labelMedium: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 14),
            labelSmall: TextStyle(fontFamily: 'PingFangSC-Light', fontSize: 12),            
          ),
          buttonTextTheme: const CustomButtonTextTheme(
            buttonLarge: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 18),
            buttonMedium: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 16),
            buttonSmall: TextStyle(fontFamily: 'PingFangSC-Regular', fontSize: 14)         
          )
        );
}