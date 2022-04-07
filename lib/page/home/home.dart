import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/custom_icons.dart';

import '../../constant/theme.dart';
import '../../widget/search_field.dart';
import '../../page/home/widget.dart' as home_widget;

/// 首页
class Home extends StatelessWidget {
  final String title;
  const Home({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // appbar高度
          toolbarHeight: 40,
          // 总高度 
          expandedHeight: 85,
          floating: true,
          pinned: true,
          // snap: true,
          // 固定flexibleSpace
          stretch: false,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            title: const SearchField(height: 40, readOnly: true,),
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 2, left: 15, right: 15),
            background: SafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 42),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyle.title1Style
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: home_widget.Banner(),
          ),
        ),
        const home_widget.MenuList(),
        const SliverToBoxAdapter(
          child: home_widget.GroupHorizontalTitle(title: '日常',),
        ),
        const SliverToBoxAdapter(
          child: home_widget.GroupHorizontalList()
        ),
        
        const SliverToBoxAdapter(
          child: home_widget.ActivityGroup()
        ),
        const SliverToBoxAdapter(
          child: home_widget.ActivityGroup()
        ),
        SliverPadding(
            padding: const EdgeInsets.all(50),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 3,//宽高比3:1
              ),

              delegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blue[100*(index%8)],
                    child: Text("我是Item  $index"),
                  );
                },
                childCount: 36,
              ),
            ),
          ),
        SliverSafeArea(
          sliver: SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.yellow[100*(index%8)],
                  child: Text("一百零八将  $index"),
                );
              },
              childCount: 108,
            ),
            itemExtent: 30,//高度为30
          ),
        )
         
      ],
    );
  }
}