import 'package:flutter/material.dart';
import 'screenutil/src/size_extension.dart';

class WidgetCommmon {

  //显示底部弹框的功能
  static void showBottomSheet(BuildContext context,{required WidgetBuilder builder}) {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
      builder: builder,
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    );
  }
}