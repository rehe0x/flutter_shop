
import 'package:flutter/material.dart';

import '../../constant/theme.dart';

class SearchGoodsBody extends StatelessWidget {
  const SearchGoodsBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          // padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
          children: [
            const Text('第二页', style: AppStyle.title1Style,),
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
              children:  [
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
                InkWell(
                  child: Text('ceshi2'),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const _MyCustomScrollViewTest()));
                  },
                )
              ],
            )
          ],
        ),
    );
  }
}
