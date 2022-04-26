
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'custom_theme.dart';

/// 主题配置
class ThemeConstant{

  static CustomTextTheme textTheme = CustomTextTheme(
            titleLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),

            labelLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
            labelMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            labelSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400), 

            displayLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            displayMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            displaySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),              
          );

  static  CustomButtonTextTheme buttonTextTheme = CustomButtonTextTheme(
            buttonLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            buttonMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            buttonSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)         
          );


  static CustomTheme main = CustomTheme(
          primaryColor: const Color.fromARGB(255, 12, 65, 135), 
          primaryBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          primaryAccentColor: const Color.fromARGB(255, 245, 245, 245),  
          scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250), 
          scaffoldAccentColor: const Color.fromARGB(255, 235, 235, 235), 
          divideColor: const Color.fromARGB(255, 222, 222, 222),
          bottomAppBarColor: const Color.fromARGB(255, 145, 145, 145), 
          primaryTextColor: const Color.fromARGB(255, 30, 30, 30), 
          labelTextColor: const Color.fromARGB(255, 145, 145, 145), 
          primaryIconColor: const Color.fromARGB(255, 30, 30, 30), 
          labelIconColor: const Color.fromARGB(255, 145, 145, 145), 
          textTheme: textTheme,
          buttonTextTheme: buttonTextTheme
        );

  
  static CustomTheme dark = CustomTheme(
          primaryColor: const Color.fromARGB(255, 192, 247, 211), 
          primaryBackgroundColor: const Color.fromARGB(255, 10, 10, 10),
          primaryAccentColor: const Color.fromARGB(255, 25, 25, 25),  
          scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20), 
          scaffoldAccentColor: const Color.fromARGB(255, 40, 40, 40), 
          divideColor: const Color.fromARGB(255, 60, 60, 60), 
          bottomAppBarColor: const Color.fromARGB(255, 160, 160, 160), 
          primaryTextColor: const Color.fromARGB(255, 225, 225, 225), 
          labelTextColor: const Color.fromARGB(255, 160, 160, 160), 
          primaryIconColor: const Color.fromARGB(255, 225, 225, 225), 
          labelIconColor: const Color.fromARGB(255, 160, 160, 160), 
          textTheme: textTheme,
          buttonTextTheme: buttonTextTheme
        );
}