
import 'package:flutter/cupertino.dart';

import '../page/search/search_route.dart';

/// 全局tab切换 搜索页键盘焦点
class AppGlobal{

  /// 首页tabbar切换需要
  static final CupertinoTabController cupertinoTabController = CupertinoTabController();
  /// 首页搜索点击跳转到搜索页
  static final FocusNode searchFocusNode = FocusNode();
  
  /// 搜索页全局路由器
  static final SearchRouterDelegate searchRouterDelegate = SearchRouterDelegate();

  /// 切换tab
  static void updateTabIndex(int index){
    cupertinoTabController.index = index;
  }

  /// 获取搜索页焦点
  static void updateSearchFocus(bool hasFocus){
    if (hasFocus && !searchFocusNode.hasFocus) {
      searchFocusNode.requestFocus();
    } else if (!hasFocus && searchFocusNode.hasFocus){
      searchFocusNode.unfocus();
    }
  }
}
