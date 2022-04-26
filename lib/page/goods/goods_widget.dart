import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/common/widget_common.dart';
import 'package:flutter_shop/provider/app_global.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/body_delegate.dart';

import '../../theme/themes.dart';

class FilterHeadBar extends StatefulWidget {
  final Function(int value) sortOnChanged;
  final Function() endDrawerChanged;
  const FilterHeadBar({required this.sortOnChanged,required this.endDrawerChanged, Key? key }) : super(key: key);

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
          RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
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
              widget.endDrawerChanged();
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
            color: AppThemes.of(context).divideColor,
          ),
          buildSelectItem(context, 2, '销售量'),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).divideColor,
          ),
          buildSelectItem(context, 3, '订单数'),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).divideColor,
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
        _groupValue = int.parse(v.toString());
        Navigator.of(context).pop();
        widget.sortOnChanged(int.parse(v.toString()));
      });
  }
}


class FilterDrawer extends StatelessWidget {
  const FilterDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 40.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                minSize: 0,
                child: Text('关闭', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                onPressed: (){
                  // AppGlobal.searchRouterDelegate.pop();
                  Navigator.of(context).pop();
                },
              ),
              Text('过滤条件', style: AppThemes.of(context).textTheme.titleSmall),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                minSize: 0,
                child: Text('重置', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                onPressed: (){
                  // AppGlobal.searchRouterDelegate.pop();
                },
              ),
            ],
          ),
          actions: const [Text('')],
          elevation: 0,
          backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        ),
        body: Builder(
          builder: (context) {
            return ListView(
              children: ListTile.divideTiles(
                color: AppThemes.of(context).divideColor,
                context: context,
                tiles: [
                  ListTile(
                    title: Text('分类', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('品牌', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('关键字', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('型号', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                ]
              ).toList()
            );
          }
        ),
        endDrawer: Drawer(
          child: Scaffold(
            backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              toolbarHeight: 40.h,
              leading: CupertinoButton(
                padding: const EdgeInsets.all(0),
                minSize: 0,
                child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                onPressed: (){
                  // AppGlobal.searchRouterDelegate.pop();
                  Navigator.of(context).pop();
                },
              ),
              title: Text('品牌', style: AppThemes.of(context).textTheme.titleSmall),
              actions: const [Text('')],
              elevation: 0,
              backgroundColor: AppThemes.of(context).primaryBackgroundColor,
            ),
          )
        ),
        floatingActionButton: CupertinoButton(
          color: AppThemes.of(context).primaryColor,
          // padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          borderRadius: BorderRadius.circular(30.r),
          // minSize: 35,
          child: Text('搜索', style: TextStyle(fontSize: 14, color: AppThemes.of(context).primaryAccentColor),),
          onPressed: (){},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      )
    );
  }
}