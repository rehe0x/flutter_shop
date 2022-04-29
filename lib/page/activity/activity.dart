import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/themes.dart';

class Activity extends StatelessWidget {
  const Activity({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text('精选'),
      ),
    );
  }
}