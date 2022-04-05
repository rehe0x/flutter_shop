import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import '../constant/theme.dart';

class SearchField extends StatefulWidget {
  final double? width;
  final double? height;
  

  const SearchField({ Key? key, this.width, this.height }) : super(key: key);

  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(33),
                                  borderSide: const BorderSide(
                                    color: AppTheme.primarySubBackgroundColor,
                                  ),
                                );

  @override
  State<SearchField> createState() => _SearchFieldState();

}

class _SearchFieldState extends State<SearchField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  bool _focus = false;

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
  void initState (){
    super.initState();
    _focusNodeAddListener();
  }

  _focusNodeAddListener(){
    _focusNode.addListener(() {
      setState(() {
        _focus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
  }

  Container suffixIcon = Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 10),
      child: const Icon(CustomIcons.close, size: 18,color: AppTheme.primarySubBackgroundColor,),
      decoration: BoxDecoration(
        color: AppTheme.primaryDisabledColor,
        borderRadius: BorderRadius.circular(150)
      ),
    );

  @override
  Widget build(BuildContext context) {
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
              style: AppStyle.title3Style,
              cursorColor: AppTheme.primaryColor,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.primarySubBackgroundColor,
                hintText: '搜索',
                hintStyle: AppStyle.titleSub2Style,
                // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                border: InputBorder.none,
                enabledBorder: SearchField._outlineInputBorder,
                focusedBorder: SearchField._outlineInputBorder,
                prefixIcon: const Icon(CustomIcons.search),
                suffixIcon: _focus ? GestureDetector(
                  child: suffixIcon,
                  onTap: (){
                    _textEditingController.clear();
                  },
                ) : const Icon(CustomIcons.scan),
                suffixIconConstraints: _focus ? const BoxConstraints() : null
              ),
            ),
          ),
        ),
        const SizedBox(width: 5,),
         _focus ? CupertinoButton(
           padding: const EdgeInsets.all(0),
           minSize: 0,
           child: const Text('取消', style: AppStyle.textButton3Style,),
           onPressed: (){
            unFocusFunction();
           },
         ) : const Icon(CustomIcons.cartFill),
      ],
    );
  }
}