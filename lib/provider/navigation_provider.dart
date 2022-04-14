import 'package:flutter/cupertino.dart';

/// 全局tab切换 搜索页键盘焦点
class NavigationProvider extends ChangeNotifier {

  /// 首页tabbar切换需要
  final CupertinoTabController cupertinoTabController = CupertinoTabController();
  /// 首页搜索点击跳转到搜索页
  final FocusNode searchFocusNode = FocusNode();

  /// 切换tab
  void updateTabIndex(int index){
    cupertinoTabController.index = index;
  }
  /// 获取搜索页焦点
  void updateSearchFocus(bool hasFocus){
    if (hasFocus && !searchFocusNode.hasFocus) {
      searchFocusNode.requestFocus();
    } else if (!hasFocus && searchFocusNode.hasFocus){
      searchFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    cupertinoTabController.dispose();
    searchFocusNode.dispose();
  }
}