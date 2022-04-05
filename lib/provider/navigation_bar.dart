import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  CupertinoTabController cupertinoTabController = CupertinoTabController();

  void updateIndex(int index){
    print('ceshi$index');
    cupertinoTabController.index = index;
    notifyListeners();
  }
}