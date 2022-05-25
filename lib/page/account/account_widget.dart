import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/page/login/login.dart';
import 'package:flutter_shop/routes/app_delegate.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/theme/themes.dart';

import '../../common/widget_common.dart';

class AccountHead extends StatelessWidget {
  const AccountHead({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60.r,
              width: 60.r,
              decoration: BoxDecoration(
                color: AppThemes.of(context).scaffoldAccentColor,
                borderRadius: BorderRadius.circular(40).r,
                image: const DecorationImage(
                  image: NetworkImage('https://static.runoob.com/images/demo/demo2.jpg',),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: 15.w,),
            GestureDetector(
              onTap: (){
                // RouteBaseDelegate.of<AppRouterDelegate>(context)!.push(name: RoutePages.login);
                WidgetCommmon.showFullBottomSheet(
                  context,
                  builder: (context) => Login(),
                );
              },
              child: Row(
                children: [
                  Text('登录', style: AppThemes.of(context).textTheme.titleLarge,),
                  Icon(Icons.keyboard_arrow_right, size: 32.sp, color: AppThemes.of(context).primaryIconColor,),
                ],
              ),
            ),
          
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                // child: Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,)
                child: CupertinoButton(
                  color: AppThemes.of(context).primaryAccentColor,
                  pressedOpacity: 0.1,
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8).r,
                  borderRadius: BorderRadius.circular(30.r),
                  minSize: 0,
                  child: Icon(CustomIcons.cart, color: AppThemes.of(context).primaryIconColor,),
                  onPressed: (){
                    // RouteBaseDelegate.of<AppRouterDelegate>(context)?.push(name: RoutePages.indexCartSettlement);
                  },
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 22.h,),
        Row(
          children: [
            CupertinoButton(
              color: AppThemes.of(context).primaryAccentColor,
              pressedOpacity: 0.1,
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15).r,
              borderRadius: BorderRadius.circular(30.r),
              minSize: 0,
              child: Row(
                children: [
                  Icon(CustomIcons.people,size: 20.sp, color: AppThemes.of(context).primaryIconColor,),
                  SizedBox(width: 5.w,),
                  Text('设置', style: AppThemes.of(context).textTheme.labelSmall,),
                ],
              ),
              
              onPressed: (){
                // RouteBaseDelegate.of<AppRouterDelegate>(context)?.push(name: RoutePages.indexCartSettlement);
              },
            ),
            SizedBox(width: 15.w,),
            CupertinoButton(
              color: AppThemes.of(context).primaryAccentColor,
              pressedOpacity: 0.1,
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15).r,
              borderRadius: BorderRadius.circular(30.r),
              minSize: 0,
              child: Row(
                children: [
                  Icon(CustomIcons.people,size: 20.sp, color: AppThemes.of(context).primaryIconColor,),
                  SizedBox(width: 5.w,),
                  Text('消息', style: AppThemes.of(context).textTheme.labelSmall,),
                ],
              ),
              
              onPressed: (){
                // RouteBaseDelegate.of<AppRouterDelegate>(context)?.push(name: RoutePages.indexCartSettlement);
              },
            ),
            
          ],
        )
      ],
    );
  }
}


class OrderMenu extends StatelessWidget {
  const OrderMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(CustomIcons.home, size: 35, color: AppThemes.of(context).primaryIconColor,),
            Text('待支付', style: AppThemes.of(context).textTheme.labelMedium,)
          ],
        ),
        Column(
          children: [
            Icon(CustomIcons.home, size: 35, color: AppThemes.of(context).primaryIconColor,),
            Text('待收货', style: AppThemes.of(context).textTheme.labelMedium,)
          ],
        ),
        Column(
          children: [
            Icon(CustomIcons.home, size: 35, color: AppThemes.of(context).primaryIconColor,),
            Text('待评价', style: AppThemes.of(context).textTheme.labelMedium,)
          ],
        ),
        Column(
          children: [
            Icon(CustomIcons.home, size: 35, color: AppThemes.of(context).primaryIconColor,),
            Text('我的订单', style: AppThemes.of(context).textTheme.labelMedium,)
          ],
        )
      ],
    );
  }
}