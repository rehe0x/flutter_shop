import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:provider/provider.dart';
import '../constant/theme.dart';
import '../provider/navigation_bar.dart';

class SearchField extends StatefulWidget {
  final double? width;
  final double? height;
  final bool readOnly;
  final bool autofocus;
  const SearchField({Key? key, this.width, this.height,
   this.readOnly = false, this.autofocus = false,
   }) : super(key: key);


  @override
  State<SearchField> createState() => _SearchFieldState();

}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  late final NavigationBarProvider navigationBarProvider;
  late final FocusNode _focusNode;
  bool _focus = false;

  @override
  void initState (){
    super.initState();
    //  获取Provider 类
    navigationBarProvider = Provider.of<NavigationBarProvider>(context, listen: false);
    // 搜索页键盘事件用Provider FocusNode 为了从首页点过去每次都获取焦点
    _focusNode = widget.autofocus ? navigationBarProvider.focusNode : FocusNode();
    _focusNodeAddListener();
  }

  _focusNodeAddListener(){
    _focusNode.addListener(() {
      // 点击首页搜索框切换到搜索页
      if (_focusNode.hasFocus && navigationBarProvider.cupertinoTabController.index != 2) {
        // 关闭首页键盘焦点
        unFocusFunction();
        // 打开搜索页焦点
        navigationBarProvider.updateRequestFocus(true);
        // 跳转搜索页
        navigationBarProvider.updateIndex(2);
      }
      setState(() {
        _focus = _focusNode.hasFocus;
      });
    });
  }


  //获取焦点
  void getFocusFunction(BuildContext context){
    FocusScope.of(context).requestFocus(_focusNode);
  }

//失去焦点
  void unFocusFunction(){
    _focusNode.unfocus();
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


  @override
  Widget build(BuildContext context) {

    final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide(
                                      color: AppThemes.of(context).primaryAccentColor,
                                    ),
                                  );

    final Container suffixIcon = Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 10),
        child: Icon(CustomIcons.close, size: 18,color: AppThemes.of(context).primaryBackgroundColor,),
        decoration: BoxDecoration(
          color: AppThemes.of(context).primaryColor,
          borderRadius: BorderRadius.circular(150)
        ),
      );

    return Row(
      // mainAxisSize: MainAxisSize.max,
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
                hintStyle: AppThemes.of(context).textTheme.labelMedium,
                // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                border: InputBorder.none,
                enabledBorder: _outlineInputBorder,
                focusedBorder: _outlineInputBorder,
                prefixIcon: Icon(CustomIcons.search, color: AppThemes.of(context).labelIconColor,),
                suffixIcon: _focus ? GestureDetector(
                  child: suffixIcon,
                  onTap: (){
                    _textEditingController.clear();
                  },
                ) : Icon(CustomIcons.scan, color: AppThemes.of(context).labelIconColor),
                suffixIconConstraints: _focus ? const BoxConstraints() : null
              ),
            ),
          ),
        ),
        const SizedBox(width: 5,),
         _focus ? CupertinoButton(
           padding: const EdgeInsets.all(0),
           minSize: 0,
           child: Text('取消', style: AppThemes.of(context).buttonTextTheme.buttonSmall,),
           onPressed: (){
            unFocusFunction();
           },
         ) : Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
      ],
    );
  }
}