
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/screenutil/flutter_screenutil.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../theme/themes.dart';

/// 搜索页商品内容
class SearchGoodsBody extends StatelessWidget {
  const SearchGoodsBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
       body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        slivers: [
          SliverAppBar(
            backgroundColor: AppThemes.of(context).primaryBackgroundColor,
            leading: CupertinoButton(
              padding: const EdgeInsets.all(0),
              minSize: 0,
              child: Text('取消', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
              onPressed: (){
                
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 0,
                  child: Text('排序', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                  onPressed: (){
                    AppThemes.change(context, ThemeEnum.dark);
                  },
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  minSize: 0,
                  child: Text('筛选', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                  onPressed: (){
                    AppThemes.change(context, ThemeEnum.dark);
                  },
                )
              ],
            ),
            toolbarHeight: 40.h,
          ),
          // SliverPersistentHeader(
          //   //是否固定头布局 默认false
          //   pinned: false,
          //   //是否浮动 默认false
          //   floating: false,
          //   //必传参数,头布局内容
          //   delegate: MySliverPHeaderDelegate(
          //     //缩小后的布局高度
          //     minHeight: 0.0,
          //     //展开后的高度
          //     maxHeight: 40.0, 
          //     child: Container(
          //       color: Colors.white,
          //       child: Text('是登陆福建多少垃圾分类是宽度减肥'),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 30,
          //     color: Colors.red,
          //   ),
          // ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10.r),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, index) {
                  return const _GoodsItem();
                },
                childCount: 60
              ),
              itemExtent: 160.h,
            ),
          ),
           
        ],
       ),
    );
  }
}

class MySliverPHeaderDelegate {
  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //子Widget布局

  MySliverPHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(MySliverPHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

}

class _GoodsItem extends StatelessWidget {
  const _GoodsItem({ Key? key }) : super(key: key);
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
                  '距离圣诞节福利时间到风口浪尖上端口浪费建设快乐的肌肤脸上的肌肤框脸上的肌肤来说',
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
