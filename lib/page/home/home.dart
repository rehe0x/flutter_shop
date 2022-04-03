import 'package:flutter/material.dart';

import '../../widget/search_field.dart';

class Home extends StatelessWidget {
  String title;
  Home(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchField(),
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
