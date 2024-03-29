import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/page/search/search_model.dart';
import 'package:flutter_shop/provider/app_global.dart';
import 'package:flutter_shop/theme/themes.dart';

import '../../widget/refresh_loading.dart';

class GoodsDetail extends StatefulWidget {
  final GoodsArgument goodsArgument;
  const GoodsDetail({ required this.goodsArgument, Key? key }) : super(key: key);

  @override
  State<GoodsDetail> createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {

  @override
  void initState() {
    // AppGlobal.eventBus.fire(SearchRoute());
    super.initState();
  }


  /// 异步请求数据
  Future<void> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollFadePage(
        fetchData: fetchData,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(10).r,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text('设计的礼服建设力度肌肤', style: AppThemes.of(context).textTheme.labelLarge,),
                  Text('1223.33元', style: AppThemes.of(context).textTheme.titleLarge,),
                  Text('44402预计水电费水电费爱上 -副色', style: AppThemes.of(context).textTheme.labelMedium,),
                  Divider(color: AppThemes.of(context).divideColor,height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('销售+1000', style: AppThemes.of(context).textTheme.displayMedium,),
                      Text('好评+1000', style: AppThemes.of(context).textTheme.displayMedium,),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: AppThemes.of(context).divideColor,height: 0.h,),
                  ListTile(
                    dense: true,
                  
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('颜色', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      // Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('品牌', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('品牌', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryColor,
                      // padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      borderRadius: BorderRadius.circular(30.r),
                      // minSize: 35,
                      child: Text('加入购物车', style: TextStyle(fontSize: 14, color: AppThemes.of(context).primaryAccentColor),),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: AppThemes.of(context).primaryColor
                      )
                    ),
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryAccentColor,
                      padding: const EdgeInsets.symmetric(vertical: 0,),
                      borderRadius: BorderRadius.circular(30.r),
                      // minSize: 35,
                      child: Text('立即购买', style: TextStyle(fontSize: 14, color: AppThemes.of(context).primaryColor),),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: double.infinity,
                    child: Text('关于商品',textAlign: TextAlign.center, style: AppThemes.of(context).textTheme.titleMedium,),
                  ),
                  Text('规格', style: AppThemes.of(context).textTheme.titleSmall,),
                  Text('规格-1', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-2', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-3', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-4', style: AppThemes.of(context).textTheme.displayMedium,),
                  // Divider(color: AppThemes.of(context).divideColor,height: 30.h,),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}