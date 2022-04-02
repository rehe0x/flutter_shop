import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String title;
  Home(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(title, style: TextStyle(
              fontSize: 30
            ),),
            Text(title),
            Text(title),
          ],
        ),
      )
    );

  }
}
