import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/page/account/account_widget.dart';
import 'package:flutter_shop/theme/themes.dart';

class Account extends StatelessWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30).r,
              child: AccountHead(),
            ),
            Divider(
              height: 0.h,
              color: AppThemes.of(context).divideColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: OrderMenu(),
            ),
            Divider(
              height: 0.h,
              color: AppThemes.of(context).divideColor,
            ),
            ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(
                color: AppThemes.of(context).divideColor,
                context: context,
                tiles: [
                  ListTile(
                    title: Text('我的积分', style: AppThemes.of(context).textTheme.titleMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('我的收藏', style: AppThemes.of(context).textTheme.titleMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('最近浏览', style: AppThemes.of(context).textTheme.titleMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('帮助', style: AppThemes.of(context).textTheme.titleMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('关于', style: AppThemes.of(context).textTheme.titleMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){},
                  ),
                ]
              ).toList()
            )
          ],
        ),
      )
    );
  }
}
