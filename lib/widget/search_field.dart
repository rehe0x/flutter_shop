import 'package:flutter/material.dart';

import '../constant/theme.dart';

class SearchField extends StatelessWidget {
  double? width;
  double? height;
  SearchField({ Key? key, this.width, this.height }) : super(key: key);

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: MyThemeData.primarySubBackgroundColor,
                                  ),
                                );
                                
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        style: const TextStyle(
          color: MyThemeData.primaryTextColor,
        ),
        cursorColor: MyThemeData.primaryTextColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyThemeData.primarySubBackgroundColor,
          hintText: '搜索',
          hintStyle: const TextStyle(
            color: MyThemeData.primaryDisabledColor
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}