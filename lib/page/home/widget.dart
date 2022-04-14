import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../theme/themes.dart';
import '../../routes/delegate.dart';

/// 首页轮播部件
class Banner extends StatelessWidget {
  const Banner({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}


/// 功能菜单列表
class MenuList extends StatelessWidget {
  const MenuList ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,//按2列展示
          mainAxisSpacing: 0,//主轴边距
          crossAxisSpacing: 20,//纵轴边距
          childAspectRatio: 0.8,//宽高比3:1
        ),

        delegate: SliverChildBuilderDelegate(
          (BuildContext context,int index){
            return Container(
              // color: Colors.red,
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) { 
                        return Container(
                          height: constraints.biggest.width,
                          decoration: BoxDecoration(
                            color: Colors.blue[100*(index+1%20)],
                          ),
                          child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,)
                        );
                     },
                    )
                  ),
                  Text('菜单呢', style: AppThemes.of(context).textTheme.titleSmall,),
                ],
              ),
            );
          },
          childCount: 3,
        ),
      ),
    );
  }
}


/// 商品组标题列
class GroupHorizontalTitle extends StatelessWidget {
  final String title;
  const GroupHorizontalTitle ({required this.title, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: AppThemes.of(context).textTheme.titleLarge),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: Text('查看全部', style: AppThemes.of(context).buttonTextTheme.buttonSmall,),
            onPressed: (){
              AppRouterDelegate.of(context).push(name: '/test1');
            },
          ),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: Text('切换主题', style: AppThemes.of(context).buttonTextTheme.buttonSmall,),
            onPressed: (){
              AppThemes.change(context, ThemeEnum.dark);
            },
          )
        ],
      ),
    );
  }
}

/// 商品组横向滚动列表
/// 这里用 SingleChildScrollView 可以自适应高度Sliver套ListView 必须固定高度
class GroupHorizontalList extends StatelessWidget {
  const GroupHorizontalList({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        children: ListUtil.generate(
          length: 30,
          item: (index) => GoodsItem(goodsName: index),
          separator: (index) => const SizedBox(width: 15,)
        )
      )
    );
  }
}

/// 商品卡片
class GoodsItem extends StatelessWidget {
  final int goodsName;
  const GoodsItem({required this.goodsName, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      // color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppThemes.of(context).scaffoldAccentColor,
              borderRadius: BorderRadius.circular(14)
            ),
            child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
          ),
          Text(
            'sdfjsl放松的方式的见风使舵老师',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppThemes.of(context).textTheme.titleSmall,
          ),
          Text(
            '4343.54元',
            maxLines: 1,
            style: AppThemes.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}

/// 活动组
class ActivityGroup extends StatelessWidget {
  const ActivityGroup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('来看一看', style: AppThemes.of(context).textTheme.titleLarge,),
                  Text('买不来？', style: AppThemes.of(context).textTheme.titleMedium,)
                ],
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 150),
            child: const GroupHorizontalList(),
          )
        ],
      ),
    );
  }
}