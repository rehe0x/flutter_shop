
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/widget/search_field.dart';

import '../routes/body_delegate.dart';

/// 全局tab切换 搜索页键盘焦点
class AppGlobal{
  /// 时间总线
  static final EventBus eventBus = EventBus();
  /// 首页tabbar切换需要
  static final CupertinoTabController cupertinoTabController = CupertinoTabController();
  /// 首页搜索点击跳转到搜索页
  static final FocusNode searchFocusNode = FocusNode();
  /// 全局搜索框文本处理
  static final TextEditingController searchTextEditingController = TextEditingController();
  
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
