import 'package:flutter/material.dart';
import '../constant/theme.dart';

class SearchField extends StatelessWidget {
  final double? width;
  final double? height;
  const SearchField({ Key? key, this.width, this.height }) : super(key: key);

  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: MyThemeData.primarySubBackgroundColor,
                                  ),
                                );

static final OutlineInputBorder _enabledOutlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: MyThemeData.primaryDisabledColor,
                                  ),
                                );

static final OutlineInputBorder _focusedOutlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: MyThemeData.primaryColor,
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
          border: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
        ),
      ),
    );
  }
}