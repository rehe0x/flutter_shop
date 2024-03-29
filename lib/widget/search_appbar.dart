// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
 
// class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
//   final double height;
//   final double elevation; //阴影
//   final Widget leading;
//   final String hintText;
//   final FocusNode focusNode;
//   final TextEditingController controller;
//   final IconData prefixIcon;
//   final List<TextInputFormatter> inputFormatters;
//   final VoidCallback onEditingComplete;
 
//   const SearchAppBarWidget(
//       {Key key,
//       this.height: 46.0,
//       this.elevation: 0.5,
//       this.leading,
//       this.hintText: '搜索',
//       this.focusNode,
//       this.controller,
//       this.inputFormatters,
//       this.onEditingComplete,
//       this.prefixIcon: Icons.search})
//       : super(key: key);
 
//   @override
//   State<StatefulWidget> createState() {
//     return new SearchAppBarState();
//   }
 
//   ///这里设置控件（appBar）的高度
//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
 
// class SearchAppBarState extends State<SearchAppBarWidget> {
//   bool _hasDeleteIcon = false;
 
//   @override
//   Widget build(BuildContext context) {
//     return new PreferredSize(
//       child: new Stack(
//         children: <Widget>[
//           Offstage(
//             offstage: false,
//             child:
//                 MoreWidgets.buildAppBar(context, '', leading: widget.leading),
//           ),
//           Offstage(
//             offstage: false,
//             child: Flex(
//               direction: Axis.horizontal,
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     height: 70,
//                     margin: EdgeInsets.only(left: 10),
//                     padding: const EdgeInsets.only(left: 0.0, top: 36.0),
//                     child: new TextField(
//                       focusNode: widget.focusNode,
 
//                       /// 键盘类型
//                       keyboardType: TextInputType.text,
 
//                       ///控制键盘的功能键 指enter键，比如此处设置为next时，enter键
//                       textInputAction: TextInputAction.search,
//                       controller: widget.controller,
//                       maxLines: 1,
//                       inputFormatters: widget.inputFormatters,
//                       decoration: InputDecoration(
//                         hintText: widget.hintText,
//                         hintStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16.5,
//                         ),
//                         suffixIcon: Container(
//                           padding: EdgeInsetsDirectional.only(
//                             start: 2.0,
//                             end: _hasDeleteIcon ? 0.0 : 0,
//                           ),
//                           child: _hasDeleteIcon
//                               ? new InkWell(
//                                   onTap: (() {
//                                     setState(() {
//                                       /// 保证在组件build的第一帧时才去触发取消清空内容
//                                       WidgetsBinding.instance?.addPostFrameCallback((_) => widget.controller.clear());
//                                       _hasDeleteIcon = false;
//                                     });
//                                   }),
//                                   child: Icon(
//                                     Icons.cancel,
//                                     size: 18.0,
//                                     color: Colors.grey,
//                                   ),
//                                 )
//                               : new Text(''),
//                         ),
//                         contentPadding: EdgeInsets.fromLTRB(30, 10, 0, 0),
//                         filled: true,
//                         fillColor: ColorsUtil.grey(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       onChanged: (str) {
//                         setState(() {
//                           if (str.isEmpty) {
//                             _hasDeleteIcon = false;
//                           } else {
//                             _hasDeleteIcon = true;
//                           }
//                         });
//                       },
//                       onEditingComplete: widget.onEditingComplete,
//                     ),
//                   ),
//                 ),
 
//                 /// 取消按钮
//                 InkWell(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(top: 36, left: 10, right: 10),
//                     child: Text(
//                       '取消',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   onTap: () {
// //                      Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//           /// 搜索图标 （可以在TextField  prefixIcon 可以直接定义icon）
//           Positioned(
//             left: 16,
//             top: 45,
//             child: Image(
//               width: 16,
//               height: 16,
//               image: AssetImage(
//                 "images/Icon/btn_seach@2x.png",
//               ),
//               color: ColorsUtil.fromHex('#333333'),
//             ),
//           ),
//         ],
//       ),
//       preferredSize: Size.fromHeight(widget.height),
//     );
//   }
// }
 
// /// 控件点击时触发
// typedef OnItemDoubleClick = Future<void> Function(Object);
 
// ///  生成常用的AppBar
// class MoreWidgets {
 
//   static Widget buildAppBar(
//       BuildContext context,
//       String text, {
//         double fontSize: 18.0,
//         double height: 50.0,
//         double elevation: 0.5,
//         Widget leading,
//         bool centerTitle: false,
//         List<Widget> actions,
//         OnItemDoubleClick onItemDoubleClick,
//       }) {
//     return PreferredSize(
//       child: GestureDetector(
//           onDoubleTap: () {
//             if (null != onItemDoubleClick) {
//               onItemDoubleClick(null);
//             }
//           },
//           child: AppBar(
//             backgroundColor: Colors.white,
//             elevation: elevation,
//             //阴影
//             centerTitle: centerTitle,
//             title: Text(text, style: TextStyle(fontSize: fontSize)),
//             leading: leading,
//             actions: actions,
//           )),
//       preferredSize: Size.fromHeight(height),
//     );
//   }
// }