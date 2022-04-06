import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class GroupHorizontalList extends StatelessWidget {
  final String title;
  const GroupHorizontalList({ required this.title, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: AppStyle.title1Style),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                minSize: 0,
                child: const Text('查看全部', style: AppStyle.textButton3Style,),
                onPressed: (){},
              )
            ],
          ),
        ),
        
        Container(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            shrinkWrap: true,
            
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return GoodsItem(goodsName: index,);
            }, 
            separatorBuilder: (BuildContext context, int index) { 
              return const SizedBox(width: 15,);
            },
          ), 
        ),
      ],
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
      // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.primarySubBackgroundColor,
              borderRadius: BorderRadius.circular(14)
            ),
            child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
          ),
          const Text(
            '测试商',
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