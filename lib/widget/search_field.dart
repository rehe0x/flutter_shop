import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import '../common/screenutil/src/size_extension.dart';


import '../constant/custom_icons.dart';
import '../provider/app_global.dart';
import '../theme/themes.dart';

/// 搜索导航组件
class SearchField extends StatefulWidget {
  final double? width;
  final double? height;
  // 是否弹出键盘 首页不弹出
  final bool readOnly;
  // // 是否默认打开焦点
  // final bool autofocus;

  const SearchField({Key? key, this.width, this.height,
   this.readOnly = false, 
  //  this.autofocus = false,
    // this.onEditingComplete,
   }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();

}

class _SearchFieldState extends State<SearchField> {
 /// 搜索点击跳转到搜索页
  FocusNode searchFocusNode = AppGlobal.searchFocusNode;
  /// 搜索框文本处理
  TextEditingController searchTextEditingController = AppGlobal.searchTextEditingController;
  
  bool _focus = false;

  @override
  void initState (){
    if (widget.readOnly) {
      searchFocusNode = FocusNode();
      searchTextEditingController = TextEditingController();
    }
    debugPrint('_SearchFieldState=初始化${searchFocusNode.hasListeners}');
    // 搜索页键盘事件用Provider FocusNode 为了从首页点过去每次都获取焦点
    if(!searchFocusNode.hasListeners){
      _focusNodeAddListener();
    } 
    super.initState();
    
  }

  /// 监听键盘事件
  _focusNodeAddListener(){
    searchFocusNode.addListener(() {
      // 点击首页搜索框切换到搜索页
      if (searchFocusNode.hasFocus && AppGlobal.cupertinoTabController.index != 2) {
        // 关闭首页键盘焦点
        searchFocusNode.unfocus();
        // 打开搜索页焦点
        AppGlobal.updateSearchFocus(true);
        // 跳转搜索页
        AppGlobal.updateTabIndex(2);
      }

      if (AppGlobal.searchRouterDelegate.lastPage().name == PagesEnum.goodsList.toString().split('.').last
          && searchFocusNode.hasFocus) {
        AppGlobal.searchRouterDelegate.pop();
      }
      /// 在setState之前判断是否mounted（没有被销毁）
      if (mounted){
       setState(() {
          _focus = searchFocusNode.hasFocus;
        });
      }
      
    });
  }


  //获取上下焦点
  void getFocusFunction(BuildContext context){
    FocusScope.of(context).requestFocus(AppGlobal.searchFocusNode);
  }

  //隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    if(widget.readOnly) {
      searchFocusNode.dispose();
      searchTextEditingController.dispose();
    }
    super.dispose();
    
    debugPrint('_SearchFieldState=销毁');
  
  }


  void toSearchGoods() async{
    AppGlobal.searchFocusNode.unfocus();
    // 关闭键盘延迟一下 避免加载动画飘逸
    await Future.delayed(const Duration(milliseconds: 150));    
    AppGlobal.searchRouterDelegate.push(pagesEnum: PagesEnum.goodsList);
  }

  @override
  Widget build(BuildContext context) {
    print('_SearchFieldState=$_focus');
    final Container suffixIcon = Container(
        width: 20.w,
        height: 20.w,
        margin: EdgeInsets.only(right: 10.r),
        child: Icon(CustomIcons.close, size: 18.sp,color: AppThemes.of(context).primaryBackgroundColor,),
        decoration: BoxDecoration(
          color: AppThemes.of(context).primaryColor,
          borderRadius: BorderRadius.circular(150.r)
        ),
      );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: TextField(
              focusNode: searchFocusNode,
              controller: searchTextEditingController,
              style: AppThemes.of(context).textTheme.titleSmall,
              cursorColor: AppThemes.of(context).primaryColor,
              textAlignVertical: TextAlignVertical.bottom,
              // 不弹出键盘
              // readOnly: widget.readOnly,
              // // 默认获取焦点
              // autofocus: widget.autofocus,
              // 显示焦点
              showCursor: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppThemes.of(context).primaryAccentColor,
                hintText: '搜索',
                hintStyle: AppThemes.of(context).textTheme.displayMedium,
                // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.r),
                  borderSide: BorderSide.none
                ),
                // enabledBorder: _outlineInputBorder,
                // focusedBorder: _outlineInputBorder,
                prefixIcon: Icon(CustomIcons.search, color: AppThemes.of(context).labelIconColor,),
                suffixIcon: _focus ? GestureDetector(
                  child: suffixIcon,
                  onTap: (){
                    AppGlobal.searchTextEditingController.clear();
                  },
                ) : Icon(CustomIcons.scan, color: AppThemes.of(context).labelIconColor),
                suffixIconConstraints: _focus ? const BoxConstraints() : null
              ),
              onEditingComplete: (){
                if (AppGlobal.searchTextEditingController.text != '') {
                  toSearchGoods();
                }
              },
            ),
          ),
        ),
        SizedBox(width: 5.w,),
         _focus ? CupertinoButton(
           padding: const EdgeInsets.all(0),
           minSize: 0,
           child: Text('取消', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
           onPressed: (){
            AppGlobal.searchFocusNode.unfocus();
           },
         ) : Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
      ],
    );
  }
}