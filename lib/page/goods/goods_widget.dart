import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/common/widget_common.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/provider/app_global.dart';

import '../../theme/themes.dart';

class FilterHeadBar extends StatefulWidget {
  const FilterHeadBar({ Key? key }) : super(key: key);

  @override
  State<FilterHeadBar> createState() => _FilterHeadBarState();
}

class _FilterHeadBarState extends State<FilterHeadBar> {
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      actions: const [Text('')],
      backgroundColor: AppThemes.of(context).primaryBackgroundColor,
      leading: CupertinoButton(
        padding: const EdgeInsets.all(0),
        minSize: 0,
        child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
        onPressed: (){
          AppGlobal.searchRouterDelegate.pop();
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: Text('排序', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
            onPressed: (){
              WidgetCommmon.showBottomSheet(
                context,
                builder: (context) => buildBottomSheetWidget(context),
              );
            },
          ),
          SizedBox(width: 30.w,),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: Text('过滤条件', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
            onPressed: (){
              // _scaffoldKey.currentState!.openEndDrawer();
            },
          )
        ],
      ),
      toolbarHeight: 40.h,
    );
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      height: 450.h,
      decoration: BoxDecoration(
        color: AppThemes.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('排序', style: AppThemes.of(context).textTheme.titleMedium,)
            ],
          ),
          SizedBox(height: 20.h,),
          buildSelectItem(context, 1, '最高价+最低价'),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).scaffoldAccentColor,
          ),
          buildSelectItem(context, 2, '销售量'),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).scaffoldAccentColor,
          ),
          buildSelectItem(context, 3, '订单数'),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).scaffoldAccentColor,
          ),
          buildSelectItem(context, 4, '订单数ssss'),
        ],
      ),
    );
  }

  int _groupValue = 1;

  Widget buildSelectItem(BuildContext context, int value,String title){
    return RadioListTile(
      value: value,
      dense: false,
      title: Text(title, style: AppThemes.of(context).textTheme.labelMedium,),
      controlAffinity: ListTileControlAffinity.platform,
      activeColor: AppThemes.of(context).primaryColor,
      groupValue: _groupValue,
      onChanged: (v) {
        Navigator.of(context).pop();
        _groupValue = int.parse(v.toString());
        AppGlobal.eventBus.fire(GoodsArgument(sort: _groupValue));
      });
  }
}
