import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/common/common.dart';
import 'package:flutter_shop/routes/navigator2.dart';

import '../../constant/theme.dart';

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
          Text(title, style: AppStyle.title1Style),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minSize: 0,
            child: const Text('查看全部', style: AppStyle.textButton3Style,),
            onPressed: (){
              AppRouterDelegate.of(context).push(name: '/test1');
            },
          )
        ],
      ),
    );
  }
}


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


class GoodsItem extends StatelessWidget {
  final int goodsName;
  const GoodsItem({required this.goodsName, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: AppTheme.primarySubBackgroundColor,
              borderRadius: BorderRadius.circular(14)
            ),
            child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
          ),
          const Text(
            'sdfjsl放松的方式的见风使舵老师',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.title3LightStyle,
          ),
          const Text(
            '4343.54元',
            maxLines: 1,
            style: AppStyle.title3MediumStyle,
          )
        ],
      ),
    );
  }
}

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
                  const Text('菜单呢'),
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
                children: const [
                  Text('来看一看', style: AppStyle.title1Style,),
                  Text('买不来？', style: AppStyle.title2Style,)
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