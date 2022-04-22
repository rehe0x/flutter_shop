import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/app_delegate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton.filled(
            child: const Text('返回'), 
            onPressed: (){
              AppRouterDelegate.of(context).pop();
            }
          ),
          CupertinoButton.filled(
            child: const Text('下一页'), 
            onPressed: (){
              AppRouterDelegate.of(context).push(name: '/splash');
            }
          )
        ],
      )
    );
  }
}