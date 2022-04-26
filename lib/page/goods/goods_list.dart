
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/widget_common.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/page/goods/goods_widget.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/index_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/routes/body_delegate.dart';

import '../../provider/app_global.dart';
import '../../common/screenutil/flutter_screenutil.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../theme/themes.dart';
import '../../widget/refresh_loading.dart';

/// 商品列表
class GoodsList extends StatefulWidget {
  const GoodsList({ Key? key }) : super(key: key);
  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  /// 订阅事件对象
  late final StreamSubscription _busSubscription;
  /// 查询参数对象
  final GoodsArgument _goodsArgument = GoodsArgument();

  @override
  void initState(){
    _busSubscription  = AppGlobal.eventBus.on<GoodsArgument>().listen((event) {
      debugPrint('eventBus=${event.toString()}');
      refresh(event);
    });
    super.initState();
  }
  /// 刷新
  void refresh(GoodsArgument goodsArgument){
    setState(() {
      _goodsArgument.sort = goodsArgument.sort;
    });
  }
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
        /// 头部条件过滤
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            FilterHeadBar(
              sortOnChanged: (value) {
                AppGlobal.eventBus.fire(GoodsArgument(sort: value));
              },
              endDrawerChanged: (){
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),   
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
      endDrawer: FilterDrawer(),
      endDrawerEnableOpenDragGesture: false,
    );
  }
  /// 商品列表
  Widget goodsList(BuildContext context){
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, index) {
          return _GoodsItem(id: index * _goodsArgument.sort,);
        },
        childCount: 60
      ),
      itemExtent: 140.h,
    );
  }


  @override
  void dispose() {
    _busSubscription.cancel();
    super.dispose();
  }

}

class _GoodsItem extends StatelessWidget {
  final int id;
  const _GoodsItem({required this.id, Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        RouteBaseDelegate.of<IndexRouterDelegate>(context)?.push(name: RoutePages.indexGoodsDetail, arguments: GoodsArgument(goodsId: id));
      },
      child: Column(
        children:[
          SizedBox(height: 15.h,),
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
                  
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           '3322',
                    //           style: AppThemes.of(context).textTheme.displayMedium,
                    //         ),
                    //         Text(
                    //           '33342.44元',
                    //           style: AppThemes.of(context).textTheme.titleSmall,
                    //         ),
                    //       ],
                    //     ),
                    //     // CupertinoButton(
                    //     //   color: AppThemes.of(context).primaryColor,
                    //     //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    //     //   borderRadius: BorderRadius.circular(30.r),
                    //     //   minSize: 35,
                    //     //   child: Text('加入购物车', style: TextStyle(fontSize: 12, color: AppThemes.of(context).primaryAccentColor),),
                    //     //   onPressed: (){},
                    //     // ),

                    //     Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryColor,),
                    //     // SizedBox(width: 10.w,)
                    //   ],
                    // ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '33342.44元',
                          style: AppThemes.of(context).textTheme.titleSmall,
                        ),
              

                        Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryColor,),
                        // SizedBox(width: 10.w,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.h,),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).divideColor,
          ),
          // SizedBox(height: 15.h,),
        ]
      ),
    );
  }
}
