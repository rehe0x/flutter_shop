
import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/navigation_bar.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:provider/provider.dart';

import '../../constant/theme.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({ Key? key }) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) { 
    return ListView(
          // padding: const EdgeInsets.all(10),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
          children: [
            Text('历史搜索', style: AppThemes.of(context).textTheme.titleLarge,),
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
            Text('热搜商品', style: AppThemes.of(context).textTheme.titleLarge,),
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
                  child: Text('ceshi'),
                  onTap: (){
                    Navigator.pushNamed(context, 'goods_item');
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const _MyCustomScrollView2()));
                  },
                )
              ],
            )
          ],
        );
  }
}