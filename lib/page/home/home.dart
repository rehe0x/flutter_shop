import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/screenutil/src/size_extension.dart';

import '../../theme/themes.dart';
import '../../widget/refresh_loading.dart';
import '../../widget/search_field.dart';
import '../../page/home/widget.dart' as home_widget;

/// 首页
class Home extends StatelessWidget {
  final String title;
  const Home({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: _MyCustomScrollView(title: title)
    );

  }
}

/// 自定义滚动效果，搜素框吸顶效果
class _MyCustomScrollView extends StatelessWidget {
  final String title;
  const _MyCustomScrollView({required this.title, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // BouncingScrollPhysics ios风格  AlwaysScrollableScrollPhysics 不管内容是否超出屏幕
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics()
      ),
      slivers: [
        SliverAppBar(
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
          // 导航栏显示动画效果 不管滑动多少自动弹出显示
          // snap: true,
          // FlexibleSpaceBar是否和导航固定
          stretch: false,
          flexibleSpace: FlexibleSpaceBar(
            // 拉动伸缩比例
            expandedTitleScale: 1,
            title: SearchField(height: 40.h, readOnly: true,),
            centerTitle: true,
            titlePadding: EdgeInsets.only(bottom: 2.r, left: 15.r, right: 15.r),
            background: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 5).r,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppThemes.of(context).textTheme.titleMedium.copyWith(color: AppThemes.of(context).primaryColor)
                ),
              ),
            ),
          ),
        ),
        RefreshAnimated(
          fetchData: () async{
            await Future<void>.delayed(const Duration(milliseconds: 1000));
          },
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10.r),
          sliver: const SliverToBoxAdapter(
            child: home_widget.Banner(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0).r,
          sliver: const home_widget.MenuList(),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0).r,
          sliver: const SliverToBoxAdapter(
            child: home_widget.GroupHorizontalTitle(title: '日常',),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 15).r,
          sliver: const SliverToBoxAdapter(
            child: home_widget.GroupHorizontalList(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 40).r,
          sliver: const SliverToBoxAdapter(
            child: home_widget.ActivityGroup(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 40, bottom: 40).r,
          sliver: const SliverToBoxAdapter(
            child: home_widget.ActivityGroup(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: 100.r,
            height: 100.r,
            color: AppThemes.of(context).primaryColor,

          ),
        )
        // SliverPadding(
        //     padding: const EdgeInsets.all(50),
        //     sliver: SliverGrid(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,//按2列展示
        //         mainAxisSpacing: 5,//主轴边距
        //         crossAxisSpacing: 5,//纵轴边距
        //         childAspectRatio: 3,//宽高比3:1
        //       ),

        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context,int index){
        //           return Container(
        //             alignment: Alignment.center,
        //             color: Colors.blue[100*(index%8)],
        //             child: Text("我是Item  $index"),
        //           );
        //         },
        //         childCount: 36,
        //       ),
        //     ),
        //   ),
        // SliverSafeArea(
        //   sliver: SliverFixedExtentList(
        //     delegate: SliverChildBuilderDelegate(
        //           (BuildContext context,int index){
        //         return Container(
        //           alignment: Alignment.center,
        //           color: Colors.yellow[100*(index%8)],
        //           child: Text("一百零八将  $index"),
        //         );
        //       },
        //       childCount: 108,
        //     ),
        //     itemExtent: 30,//高度为30
        //   ),
        // )
         
      ],
    );
  }
}