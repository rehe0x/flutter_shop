import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/common/sticky_headers/sticky_headers.dart';
import 'package:flutter_shop/page/cart/cart_widget.dart';
import 'package:flutter_shop/theme/themes.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      /// NestedScrollView组合CustomScrollView 吸顶有时候重叠卡顿
      // body: CartNestedScrollView(),
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: buildSliverGoods(context),
          )
          
        ],
      ),
    floatingActionButton: const CartFloatingAction(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppThemes.of(context).primaryBackgroundColor,
      elevation: 0.0,
      // appbar高度
      toolbarHeight: 50.h,
      // 总高度 
      expandedHeight: 80.h,
      // 固定导航栏
      pinned: true,
      // 滑动一点导航栏就显示 否则滑倒最顶部
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        // 拉动伸缩比例
        expandedTitleScale: 1,
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 10.r, left: 15.r, right: 15.r),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 1, child: Text('全部(52)', style: AppThemes.of(context).textTheme.titleSmall)),
            Expanded(flex: 1, child: Text('无货(52)', textAlign: TextAlign.center,style: AppThemes.of(context).textTheme.titleSmall)),
            Expanded(
              flex: 1,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                minSize: 0,
                alignment: Alignment.bottomRight,
                child: Text('清空', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                onPressed: (){
                  // RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
                },
              ),
            ),
          ],
        ),
        
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5).r,
            child: Text(
              '购物车',
              textAlign: TextAlign.center,
              style: AppThemes.of(context).textTheme.titleMedium.copyWith(color: AppThemes.of(context).primaryColor)
            ),
          ),
        ),
      
      ),
    );

  }


  Widget buildSliverGoods(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, index) {
          if (index != 0 && index % 2 != 0) {
            return SizedBox(height: 20.h,);
          }
          return CartItem();
          return StickyHeader(
            // overlapHeaders: true,
            header: Container(
              // height: 50.0,
              color: Colors.blueGrey[700],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text('Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              height: 300.0 - (index*2) ,
              child: Image.network('https://static.runoob.com/images/demo/demo2.jpg', fit: BoxFit.cover,width: double.infinity, height: 200.0),
            ),
          );
        },
        childCount: 20
      ),
      // itemExtent: 300.h,
    );
  }
}




















/// cart2 暂时没用
class CartNestedScrollView extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [  
            SliverAppBar(
              backgroundColor: AppThemes.of(context).primaryBackgroundColor,
              elevation: 0.0,
              // appbar高度
              toolbarHeight: 45.h,
              // 总高度 
              expandedHeight: 90.h,
              // 固定导航栏
              pinned: true,
              // 滑动一点导航栏就显示 否则滑倒最顶部
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                // 拉动伸缩比例
                expandedTitleScale: 1,
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 15.r),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      minSize: 0,
                      child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                      onPressed: (){
                        // RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
                      },
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      minSize: 0,
                      child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                      onPressed: (){
                        // RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
                      },
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      minSize: 0,
                      child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                      onPressed: (){
                        // RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
                      },
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      minSize: 0,
                      child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                      onPressed: (){
                        // RouteBaseDelegate.of<BodyRouterDelegate>(context)?.pop();
                      },
                    ),
                  ],
                ),
                
                background: SafeArea(
                  child: Text(
                    '购物车',
                    textAlign: TextAlign.center,
                    style: AppThemes.of(context).textTheme.titleLarge.copyWith(color: AppThemes.of(context).primaryColor)
                  ),
                ),
              ),
            ),

        //  SliverPersistentHeader(
        //   //是否固定头布局 默认false
        //   pinned: true,
        //   //是否浮动 默认false
        //   floating: false,
        //   //必传参数,头布局内容
        //   delegate: MySliverPHeaderDelegate(
        //     //缩小后的布局高度
        //     minHeight: 56.0,
        //     //展开后的高度
        //     maxHeight: 56.0, 
        //     child: Container(
        //       color: Colors.white,
        //       child: Text('是登陆福建多少垃圾分类是宽度减肥'),
        //     ),
        //   ),
        // ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, index) {
                  if (index != 0 && index % 2 != 0) {
                    return SizedBox(height: 30.h,);
                  }
                  return StickyHeader(
                    // overlapHeaders: true,
                    header: Container(
                      // height: 50.0,
                      color: Colors.blueGrey[700],
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text('Header #$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    content: Container(
                      height: 300.0 - (index*2) ,
                      child: Image.network('https://static.runoob.com/images/demo/demo2.jpg', fit: BoxFit.cover,width: double.infinity, height: 200.0),
                    ),
                  );
                },
                childCount: 60
              ),
              // itemExtent: 300.h,
            )
          ],
        ),
      ),
		);
	}
}



/// 自定义头部
class MySliverPHeaderDelegate extends SliverPersistentHeaderDelegate{
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