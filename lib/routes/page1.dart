import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/page2.dart';

import 'navigator_demo.dart';

class PageDemo1 extends StatelessWidget {
  const PageDemo1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              child: Text('Page1'),
              onPressed: (){
                 AppRouterDelegateDemo.of(context).push(
                  CupertinoPage(
                    key: const ValueKey('page2'),
                    name: 'page2', 
                    child: PageDemo2(),
                  )
                );
              }
            )
          ],
        ),
      )
    );
  }
}