import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/custom_icons.dart';

import '../../constant/theme.dart';
import '../../widget/search_field.dart';

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
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          floating: true,
          pinned: true,
          snap: true,
          // 固定flexibleSpace
          stretch: false,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            title: const SearchField(height: 40,),
            // title: const SearchField(height: 40,),
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 2, left: 15, right: 15),
            background: SafeArea(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyle.title1Style
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 15),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
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
        ),
        
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverToBoxAdapter(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('精选商品', style: AppStyle.title1Style),
                    CupertinoButton(
                      child: const Text('更多', style: AppStyle.textButton3Style,),
                      onPressed: (){},
                    )
                  ],
                ),
                // Text('内容')
              ],
            )
          ),
        ),
        
        SliverPadding(
            padding: const EdgeInsets.all(10),
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