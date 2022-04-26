import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shop/common/common.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/theme/themes.dart';

import '../../widget/refresh_loading.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: _MyCustomScrollView(title: '购物车',),
    );
  }
}



/// 自定义滚动效果，搜素框吸顶效果
class _MyCustomScrollView extends StatelessWidget {
  final String title;
  const _MyCustomScrollView({required this.title, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    print('innerBoxIsScrolled=$innerBoxIsScrolled');
    return <Widget>[
      SliverPersistentHeader(
          //是否固定头布局 默认false
          pinned: false,
          //是否浮动 默认false
          floating: false,
          //必传参数,头布局内容
          delegate: MySliverPHeaderDelegate(
            //缩小后的布局高度
            minHeight: 0.0,
            //展开后的高度
            maxHeight: 40.0, 
            child: Container(
              color: Colors.white,
              child: Text('是登陆福建多少垃圾分类是宽度减肥'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.red,
          ),
        ),
     ];
  },
  body: CustomScrollView(
    slivers: [
      SliverPersistentHeader(
          //是否固定头布局 默认false
          pinned: false,
          //是否浮动 默认false
          floating: false,
          //必传参数,头布局内容
          delegate: MySliverPHeaderDelegate(
            //缩小后的布局高度
            minHeight: 0.0,
            //展开后的高度
            maxHeight: 40.0, 
            child: Container(
              color: Colors.white,
              child: Text('是登陆福建多少垃圾分类是宽度减肥'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.red,
          ),
        ),
        SliverPersistentHeader(
          //是否固定头布局 默认false
          pinned: false,
          //是否浮动 默认false
          floating: false,
          //必传参数,头布局内容
          delegate: MySliverPHeaderDelegate(
            //缩小后的布局高度
            minHeight: 0.0,
            //展开后的高度
            maxHeight: 40.0, 
            child: Container(
              color: Colors.white,
              child: Text('是登陆福建多少垃圾分类是宽度减肥'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.red,
          ),
        ),
        SliverPersistentHeader(
          //是否固定头布局 默认false
          pinned: false,
          //是否浮动 默认false
          floating: false,
          //必传参数,头布局内容
          delegate: MySliverPHeaderDelegate(
            //缩小后的布局高度
            minHeight: 20,
            //展开后的高度
            maxHeight: 40.0, 
            child: Container(
              color: Colors.white,
              child: Text('是登陆福建多少垃圾分类是宽度减肥'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.red,
          ),
        ),
    ],
  )
);

  }
}


 



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