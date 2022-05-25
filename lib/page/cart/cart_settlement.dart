import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/theme/themes.dart';

class CartSettlement extends StatelessWidget {
  const CartSettlement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 45.h,
        backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        iconTheme: IconThemeData(
          color: AppThemes.of(context).primaryIconColor
        ),
        title: Text('提交订单', style: AppThemes.of(context).textTheme.titleMedium,),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('家' ,style: AppThemes.of(context).textTheme.labelMedium,),
                        SizedBox(width: 5.w,),
                        Text('公司',style: AppThemes.of(context).textTheme.labelMedium),
                        SizedBox(width: 5.w,),
                        Text('四川省成都市青羊区',style: AppThemes.of(context).textTheme.labelMedium),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Text('新世纪广场福利中心2-4', style: AppThemes.of(context).textTheme.titleMedium),
                    SizedBox(height: 5.h,),
                    Text('小冷 1883412121',style: AppThemes.of(context).textTheme.labelMedium),
                    SizedBox(height: 5.h,),
                  ],
                ),
                // Text('>',style: AppThemes.of(context).textTheme.labelMedium)
                Icon(Icons.keyboard_arrow_right, size: 32.sp, color: AppThemes.of(context).labelIconColor,)
              ],
            ),
          ),
          Divider(
            height: 0.h,
            color: AppThemes.of(context).divideColor,
          ),
          SizedBox(height: 15.h,),
          CartSettlementItem(),
          SizedBox(height: 15.h,),
          CartSettlementItem(),
          SizedBox(height: 15.h,),
          CartSettlementItem(),
          SizedBox(height: 15.h,),
          CartSettlementInfo(),
          SizedBox(height: 30.h,),
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15).r,
        color: AppThemes.of(context).primaryBackgroundColor,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('¥18842.3', style: AppThemes.of(context).textTheme.titleLarge.copyWith(color: AppThemes.of(context).primaryColor),),
            CupertinoButton(
              color: AppThemes.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 30).r,
              borderRadius: BorderRadius.circular(30.r),
              minSize: 0,
              child: Text('提交订单', style: TextStyle(fontSize: 14.sp, color: AppThemes.of(context).primaryAccentColor),),
              onPressed: (){
                // RouteBaseDelegate.of<AppRouterDelegate>(context)?.push(name: RoutePages.indexCartSettlement);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Container(
        color: AppThemes.of(context).primaryBackgroundColor,
        height: 60.h,
      ),
    );
  }
}

class CartSettlementInfo extends StatelessWidget {
  const CartSettlementInfo ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('商品金额',style: AppThemes.of(context).textTheme.labelMedium),
              Text('¥443.3',style: AppThemes.of(context).textTheme.titleSmall),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('运费',style: AppThemes.of(context).textTheme.labelMedium),
              Text('¥12.3',style: AppThemes.of(context).textTheme.titleSmall),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('立减',style: AppThemes.of(context).textTheme.labelMedium),
              Text('¥-33',style: AppThemes.of(context).textTheme.titleSmall.copyWith(color: AppThemes.of(context).primaryColor)),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('优惠劵',style: AppThemes.of(context).textTheme.labelMedium),
              Text('¥-98',style: AppThemes.of(context).textTheme.titleSmall.copyWith(color: AppThemes.of(context).primaryColor)),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('合计：',style: AppThemes.of(context).textTheme.labelMedium),
              Text('¥9844',style: AppThemes.of(context).textTheme.titleSmall.copyWith(color: AppThemes.of(context).primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}
class CartSettlementItem extends StatelessWidget {
  const CartSettlementItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('专卖店984', style: AppThemes.of(context).textTheme.titleSmall,),
              Text('免运费', textAlign: TextAlign.right, style: AppThemes.of(context).textTheme.displayMedium,)            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 80.h,
                  child: Scrollbar(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          height: 80.r,
                          width: 80.r,
                          decoration: BoxDecoration(
                            color: AppThemes.of(context).scaffoldAccentColor,
                            borderRadius: BorderRadius.circular(10).r
                          ),
                          child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: 10.w,),
                        Container(
                          height: 80.r,
                          width: 80.r,
                          decoration: BoxDecoration(
                            color: AppThemes.of(context).scaffoldAccentColor,
                            borderRadius: BorderRadius.circular(10).r
                          ),
                          child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: 10.w,),
                        Container(
                          height: 80.r,
                          width: 80.r,
                          decoration: BoxDecoration(
                            color: AppThemes.of(context).scaffoldAccentColor,
                            borderRadius: BorderRadius.circular(10).r
                          ),
                          child: Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.contain,),
                        ),
                        SizedBox(width: 10.w,),
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
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Row(
                children: [
                  Text('共',style: AppThemes.of(context).textTheme.labelMedium),
                  Text('2',style: AppThemes.of(context).textTheme.titleSmall),
                  Text('件',style: AppThemes.of(context).textTheme.labelMedium),
                  Icon(Icons.keyboard_arrow_right, size: 28.sp, color: AppThemes.of(context).labelIconColor,)
                ],
              )
            ],
          ),
          SizedBox(height: 10.h,),
          Text('不支持7天无理由退货',style: AppThemes.of(context).textTheme.displaySmall),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('配送',style: AppThemes.of(context).textTheme.labelMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text('专用快递',style: AppThemes.of(context).textTheme.labelMedium),
                      Icon(Icons.keyboard_arrow_right, size: 24.sp, color: AppThemes.of(context).labelIconColor,)
                    ],
                  ),
                  Text('工作日、休息日均可送货',style: AppThemes.of(context).textTheme.labelMedium),
                ],
              )
            ],
          )
          
        ],
      ),
    );
  }
}
