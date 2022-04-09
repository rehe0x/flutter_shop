import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/navigator2.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: CupertinoButton.filled(
        child: Text('你好'), 
        onPressed: (){
        AppRouterDelegate.of(context).pop();
      })
      ),
    );
  }
}