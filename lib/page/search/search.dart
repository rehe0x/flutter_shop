import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/theme.dart';

import '../../widget/search_field.dart';

class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchField(height: 40,),
      ),
      body: const _MyCustomScrollView()
       
    );
  }
}

class _MyCustomScrollView extends StatelessWidget {
  const _MyCustomScrollView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        // padding: const EdgeInsets.all(10),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        children: [
          const Text('历史搜索', style: AppStyle.title1Style,),
          GridView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,//按2列展示
              mainAxisSpacing: 5,//主轴边距
              crossAxisSpacing: 5,//纵轴边距
              childAspectRatio: 3,//宽高比3:1
            ),
            children: const [
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ],
          ),
          const Text('热搜商品', style: AppStyle.title1Style,),
          GridView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,//按2列展示
              mainAxisSpacing: 5,//主轴边距
              crossAxisSpacing: 5,//纵轴边距
              childAspectRatio: 3,//宽高比3:1
            ),
            children: const [
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ],
          )
        ],
      );
  }
}
