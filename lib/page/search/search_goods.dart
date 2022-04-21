
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/app_global.dart';
import '../../common/screenutil/flutter_screenutil.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../theme/themes.dart';
import '../../widget/refresh_loading.dart';

/// 搜索页商品内容
class SearchGoodsBody extends StatefulWidget {
  const SearchGoodsBody({ Key? key }) : super(key: key);
  @override
  State<SearchGoodsBody> createState() => _SearchGoodsBodyState();
}

class _SearchGoodsBodyState extends State<SearchGoodsBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _id = 0;
  /// 异步请求数据
  Future<void> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
        /// 头部
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            sliverAppBar(context)      
          ];
        },
        /// 内容
        body: CustomScrollFadePage(
          fetchData: fetchData,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 10.r),
              sliver: goodsList(context),
            )
          ],
        ),
      ),
      endDrawer: const Drawer(child: Text('过滤条件'),),
      endDrawerEnableOpenDragGesture: false,
    );
  }

  /// 商品列表
  Widget goodsList(BuildContext context){
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, index) {
          return _GoodsItem(id: index * _id,);
        },
        childCount: 60
      ),
      itemExtent: 160.h,
    );
  }

  Widget sliverAppBar(BuildContext context){
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
              showBottomSheet();
            },
          ),
          SizedBox(width: 30.w,),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: Text('过滤条件', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
            onPressed: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
          )
        ],
      ),
      toolbarHeight: 40.h,
    );
  }

  //显示底部弹框的功能
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
      builder: (BuildContext context) {
        //构建弹框中的内容
        return buildBottomSheetWidget(context);
      }, 
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
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
        setState(() {
          _id = int.parse(v.toString());
          Navigator.of(context).pop();
          _groupValue = int.parse(v.toString());
        });
      });
  }
}
class _GoodsItem extends StatelessWidget {
  final int id;
  const _GoodsItem({required this.id, Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 5.w,),
            Container(
              height: 110.r,
              width: 110.r,
              decoration: BoxDecoration(
                color: AppThemes.of(context).scaffoldAccentColor,
                borderRadius: BorderRadius.circular(14).r
              ),
              child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                  '$id距离圣诞节福利时间到风口浪尖上端口浪费建设快乐的肌肤脸上的肌肤框脸上的肌肤来说',
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis,
                  style: AppThemes.of(context).textTheme.titleSmall
                  ),
                  Text(
                    '测试｜不错｜22*333',
                    style: AppThemes.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    '测试｜不错｜22*333',
                    style: AppThemes.of(context).textTheme.displayMedium,
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3322',
                            style: AppThemes.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '33342.44元',
                            style: AppThemes.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      CupertinoButton(
                        color: AppThemes.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        minSize: 35,
                        child: Text('加入购物车', style: TextStyle(fontSize: 12, color: AppThemes.of(context).primaryAccentColor),),
                        onPressed: (){},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Divider(
          color: AppThemes.of(context).scaffoldAccentColor,
        )
      ]
    );
  }
}
