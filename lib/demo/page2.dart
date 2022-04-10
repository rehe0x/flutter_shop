import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigator_demo.dart';

class PageDemo2 extends StatelessWidget {
  const PageDemo2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              child: Text('Page2'),
              onPressed: (){
                AppRouterDelegateDemo.of(context).pop();
              }
            )
          ],
        ),
      )
    );
  }
}