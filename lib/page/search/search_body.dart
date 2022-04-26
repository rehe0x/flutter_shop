
import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../routes/body_delegate.dart';
import '../../theme/themes.dart';

/// 搜索页默认内容
class SearchBody extends StatelessWidget {
  const SearchBody({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) { 
    return ListView(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 15).r,
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
          children: [
            Text('历史搜索', style: AppThemes.of(context).textTheme.titleMedium,),
            SizedBox(height: 20.h,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 5,//宽高比5:1
              ),
              children: [
                Text('水电费发水淀粉', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('公司发发发', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('vv啥地方', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('啊啊啊啊', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('冷冷的', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('发发发房贷首付', style: AppThemes.of(context).textTheme.labelMedium,),
                Text('哦哦哦奋斗奋斗副', style: AppThemes.of(context).textTheme.labelMedium,),
              ],
            ),
            SizedBox(height: 30.h,),
            Text('热搜商品', style: AppThemes.of(context).textTheme.titleMedium,),
            SizedBox(height: 20.h,),
            GridView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//按2列展示
                mainAxisSpacing: 5,//主轴边距
                crossAxisSpacing: 5,//纵轴边距
                childAspectRatio: 5,//宽高比3:1
              ),
              children:  [
                Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                InkWell(
                  child: Text('水电费发水淀粉', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                  onTap: (){
                        RouteBaseDelegate.of<BodyRouterDelegate>(context)?.push(name: RoutePages.bodyGoods);

                    // Navigator.pushNamed(context, 'goods_item');
                    // BodyRouterDelegate.of(context).push(name: RoutePages.goodsList);
                  },
                )
              ],
            )
          ],
        );
  }
}