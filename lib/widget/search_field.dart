import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/screenutil/src/size_extension.dart';


import '../constant/custom_icons.dart';
import '../provider/app_global.dart';
import '../theme/themes.dart';


typedef OnEditingCompleteCallback = void Function();

/// 搜索导航组件
class SearchField extends StatefulWidget {
  final double? width;
  final double? height;
  // 是否弹出键盘 首页不弹出
  final bool readOnly;
  // 是否默认打开焦点
  final bool autofocus;

  final OnEditingCompleteCallback? onEditingComplete;
  const SearchField({Key? key, this.width, this.height,
   this.readOnly = false, this.autofocus = false,
    this.onEditingComplete,
   }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();

}

class _SearchFieldState extends State<SearchField> {
  /// 默认controller首页用 搜索页会传一个全局controller
  final TextEditingController _textEditingController = TextEditingController();
  
  /// 获取全局处理对象
  late final FocusNode _focusNode;

  bool _focus = false;


  @override
  void initState (){
    super.initState();
    // 搜索页键盘事件用Provider FocusNode 为了从首页点过去每次都获取焦点
    _focusNode = widget.autofocus ? AppGlobal.searchFocusNode : FocusNode();
    _focusNodeAddListener();
  }
  
  /// 监听键盘时间
  _focusNodeAddListener(){
    _focusNode.addListener(() {
      // 点击首页搜索框切换到搜索页
      if (_focusNode.hasFocus && AppGlobal.cupertinoTabController.index != 2) {
        // 关闭首页键盘焦点
        _focusNode.unfocus();
        // 打开搜索页焦点
        AppGlobal.updateSearchFocus(true);
        // 跳转搜索页
        AppGlobal.updateTabIndex(2);
      }
      /// 如果是列表获取焦点跳转到上一页
      if (AppGlobal.searchRouterDelegate.lastPage().name == '/goods' 
          && _focusNode.hasFocus) {
        AppGlobal.searchRouterDelegate.pop();
      }
      setState(() {
        _focus = _focusNode.hasFocus;
      });
    });
  }


  //获取上下焦点
  void getFocusFunction(BuildContext context){
    FocusScope.of(context).requestFocus(_focusNode);
  }

  //隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
  }


  void toSearchGoods() async{
    _focusNode.unfocus();
    // 关闭键盘延迟一下 避免加载动画飘逸
    await Future.delayed(const Duration(milliseconds: 150));    
    AppGlobal.searchRouterDelegate.push(name: '/goods');
  }

  @override
  Widget build(BuildContext context) {

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
              focusNode: _focusNode,
              controller: _textEditingController,
              style: AppThemes.of(context).textTheme.titleSmall,
              cursorColor: AppThemes.of(context).primaryColor,
              textAlignVertical: TextAlignVertical.bottom,
              // 不弹出键盘
              readOnly: widget.readOnly,
              // 默认获取焦点
              autofocus: widget.autofocus,
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
                    _textEditingController.clear();
                  },
                ) : Icon(CustomIcons.scan, color: AppThemes.of(context).labelIconColor),
                suffixIconConstraints: _focus ? const BoxConstraints() : null
              ),
              onEditingComplete: (){
                if (_textEditingController.text != '') {
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
            _focusNode.unfocus();
           },
         ) : Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
      ],
    );
  }
}