
import 'package:flutter/material.dart';

class ListUtil {
  static List<Widget> generate({
    required int length,
    required Function(int index) item,
    Function(int index)? separator
  }){
    List<Widget> list = [];
    for (int i= 0; i < length; i++) {
     list.add(item(i));
     if (separator != null && i < length - 1){
       list.add(separator(i));
     }
   } 
   return list;
  }
}