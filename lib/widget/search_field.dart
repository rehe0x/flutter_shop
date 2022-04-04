import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import '../constant/theme.dart';

class SearchField extends StatelessWidget {
  final double? width;
  final double? height;
  const SearchField({ Key? key, this.width, this.height }) : super(key: key);

  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: AppTheme.primarySubBackgroundColor,
                                  ),
                                );

static final OutlineInputBorder _enabledOutlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: AppTheme.primaryDisabledColor,
                                  ),
                                );

static final OutlineInputBorder _focusedOutlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: AppTheme.primaryColor,
                                  ),
                                );
                                
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        style: AppStyle.title3Style,
        cursorColor: AppTheme.primaryColor,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.primarySubBackgroundColor,
          hintText: '搜索',
          hintStyle: AppStyle.titleSub2Style,
          // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          border: InputBorder.none,
          enabledBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          prefixIcon: const Icon(CustomIcons.search),
          // suffixIcon: const Icon(CustomIcons.close),
          suffixIcon: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(CustomIcons.close, size: 18,color: AppTheme.primarySubBackgroundColor,),
            decoration: BoxDecoration(
              color: AppTheme.primaryDisabledColor,
              borderRadius: BorderRadius.circular(150)
            ),
          ),
          suffixIconConstraints: const BoxConstraints()

        ),
      ),
    );
  }
}