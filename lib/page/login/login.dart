import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/routes/app_delegate.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/widget/formfield.dart';

import '../../theme/themes.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h),
      child: Scaffold(
        backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.close, size: 32.sp,),
            onPressed: () { 
              Navigator.of(context).pop();
            },
          ),
          iconTheme: IconThemeData(
            color: AppThemes.of(context).primaryIconColor
          ),
          title: Text('登录', style: AppThemes.of(context).textTheme.titleMedium,),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('您好', style: AppThemes.of(context).textTheme.titleLarge,),
                  Text('你可以使用电子邮箱或手机号账号继续。', style: AppThemes.of(context).textTheme.labelMedium,)
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Text('使用手机号登录', style: TextStyle(fontSize: 16.sp, color: AppThemes.of(context).primaryAccentColor),),
                      onPressed: (){
                        RouteBaseDelegate.of<AppRouterDelegate>(context)!.push(name: RoutePages.loginMobile);
                      },
                    ),
                  ),
                  Divider(
                    height: 60.h,
                    color: AppThemes.of(context).divideColor,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryAccentColor,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Text('微信登录', style: TextStyle(fontSize: 16, color: AppThemes.of(context).primaryColor),),
                      onPressed: (){},
                    ),
                  ),
                
                  SizedBox(height: 10.h,),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryAccentColor,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Text('Google登录', style: TextStyle(fontSize: 16, color: AppThemes.of(context).primaryColor),),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    minSize: 0,
                    child: Text('创建账户', style: AppThemes.of(context).buttonTextTheme.buttonSmall,),
                    onPressed: (){
                      // AppGlobal.searchRouterDelegate.pop();
                      // Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 70.h,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class LoginMobile extends StatelessWidget {
   LoginMobile({ Key? key }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
        toolbarHeight: 45.h,
        // leading: IconButton(
        //   icon: Icon(Icons.close, size: 32.sp,),
        //   onPressed: () { 
        //     Navigator.of(context).pop();
        //   },
        // ),
        iconTheme: IconThemeData(
          color: AppThemes.of(context).primaryIconColor
        ),
        title: Text('手机号登录', style: AppThemes.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('欢迎' ,style: AppThemes.of(context).textTheme.titleLarge,),
              SizedBox(height: 30.h,),
              CustomFormField(
                title: '手机号',
                validator: (value) {
                  if (!RegExp(r'^\d{11}$').hasMatch(value!)) {
                    return '请输入11位手机号码';
                  }
                  return null;
                },
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(
                //       RegExp(r'^-?[1-9]([0-9]{1,8})?')),
                // ],
                onEditingComplete: () => _formKey.currentState!.validate(),
              ),
              SizedBox(height: 20.h,),
              CustomFormField(
                title: '验证码',
                validator: (value) {
                  if (!RegExp(r'^\d{6}$').hasMatch(value!)) {
                    return '请输入6位验证码';
                  }
                  return null;
                },
                // onEditingComplete: () {
                //   if (_formKey.currentState!.validate()) {
                    
                //   }
                // },
              ),
              
              SizedBox(height: 100.h,),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: AppThemes.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                  child: Text('登录', style: TextStyle(fontSize: 16.sp, color: AppThemes.of(context).primaryAccentColor),),
                  onPressed: (){
                    RouteBaseDelegate.of<AppRouterDelegate>(context)!.pop();
                    // Navigator.of(context).pop();
                    // RouteBaseDelegate.of<AppRouterDelegate>(context)!.push(name: RoutePages.loginMobile);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}