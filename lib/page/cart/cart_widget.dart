import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/index_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/theme/themes.dart';

class CartItem extends StatelessWidget {
  const CartItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 10.r),
      decoration: BoxDecoration(
        color: AppThemes.of(context).primaryAccentColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppThemes.of(context).divideColor.withOpacity(0.4),
            spreadRadius: 1,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio(
                value: 1, 
                groupValue: 2, 
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                onChanged: (index){}
              ),
              SizedBox(width: 5.w,),
              Text('专卖店984', style: AppThemes.of(context).textTheme.titleSmall,),
              Expanded(child: Text('免运费', textAlign: TextAlign.right, style: AppThemes.of(context).textTheme.displayMedium,))
            ],
          ),
          CartGoodsItem(),
          CartGoodsItem(),
          CartGoodsItem(),
        
        ],
      ),
    );
  }
}


class CartGoodsItem extends StatelessWidget {
  const CartGoodsItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('key'),
      background: Container(color: Colors.red,),
      confirmDismiss: (d){
        return Future.value(false);
      },
      child: InkWell(
        onTap: (){
          RouteBaseDelegate.of<IndexRouterDelegate>(context)?.push(name: RoutePages.indexGoodsDetail, arguments: GoodsArgument(goodsId: 1));
        },
        child: Column(
          children:[
            SizedBox(height: 10.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1, 
                      groupValue: 2, 
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                      onChanged: (index){}
                    ),
                    SizedBox(width: 5.w,),
                    Container(
                      height: 80.r,
                      width: 80.r,
                      decoration: BoxDecoration(
                        color: AppThemes.of(context).scaffoldAccentColor,
                        borderRadius: BorderRadius.circular(10).r
                      ),
                      child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,),
                    ),
                  ],
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                      '距离圣诞节福利时间到风肌肤来说',
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.of(context).textTheme.labelMedium
                      ),
                    
                      Text(
                        '测试｜不错｜22*333',
                        style: AppThemes.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        '这是什么 先这样',
                        style: AppThemes.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '33342.44元',
                              style: AppThemes.of(context).textTheme.titleSmall,
                            ),
                          ),

                          SizedBox(
                            width: 80.w,
                            height: 30.h,
                            child: TextField(
                              controller: TextEditingController.fromValue(TextEditingValue(
                                text: '13',
                                selection: TextSelection.fromPosition(const TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: 4)))),
                              style: AppThemes.of(context).textTheme.titleSmall,
                              cursorColor: AppThemes.of(context).primaryColor,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                
                                filled: true,
                                fillColor: AppThemes.of(context).scaffoldAccentColor,
                                contentPadding: const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 16).r,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none
                                ),
                                
                                prefixIcon: Icon(CustomIcons.add, color: AppThemes.of(context).primaryColor,),
                                prefixIconConstraints: const BoxConstraints(),
                                suffixIcon: Icon(CustomIcons.add, color: AppThemes.of(context).primaryColor),
                                suffixIconConstraints: const BoxConstraints()
                               
                              ),
                              onEditingComplete: (){
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ),
                         
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h,),
          ]
        ),
      ),
    );
  }
}
