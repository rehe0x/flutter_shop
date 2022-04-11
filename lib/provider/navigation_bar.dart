import 'package:flutter/cupertino.dart';

class NavigationBarProvider extends ChangeNotifier {
  // 首页tabbar切换需要
  final CupertinoTabController cupertinoTabController = CupertinoTabController();
  // 搜索页键盘事件
  final FocusNode focusNode = FocusNode();

  void updateIndex(int index){
    cupertinoTabController.index = index;
    // notifyListeners();
  }

  void updateRequestFocus(bool hasFocus){
    if (hasFocus && !focusNode.hasFocus) {
      focusNode.requestFocus();
    } else if (!hasFocus && focusNode.hasFocus){
      focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    cupertinoTabController.dispose();
    focusNode.dispose();
  }
}