import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/common/screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/routes/base_delegate.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:flutter_shop/widget/refresh_loading.dart';

import '../../common/screenutil/src/screenutil_init.dart';

class HeaderSliverWidget extends StatefulWidget {
  final ScrollController scrollController;
  const HeaderSliverWidget({required this.scrollController, Key? key }) : super(key: key);

  @override
  State<HeaderSliverWidget> createState() => _HeaderSliverWidgetState();
}

class _HeaderSliverWidgetState extends State<HeaderSliverWidget> {

  bool headerStatus = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      ///监听滚动位置设置导航栏颜色
      if (widget.scrollController.offset > 200.h) {
        if (!headerStatus) {
          setState(() {
            headerStatus = true;
          });
        }
      } else {
        if (headerStatus) {
          setState(() {
            headerStatus = false;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 45.h,
      collapsedHeight: 45.h,
      backgroundColor: AppThemes.of(context).primaryBackgroundColor,
      expandedHeight: 300.h,
      elevation: 0,
      pinned: true,
      // leading: IconButton(
      //     icon: Icon(CustomIcons.back, size: 30.sp,color: AppThemes.of(context).primaryColor,),
      //     onPressed: (){
      //       Navigator.of(context).pop();
      //     }
      // ),
      leading: CupertinoButton(
        padding: const EdgeInsets.all(0),
        minSize: 0,
        child: Text('返回', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      actions: [
        Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
        SizedBox(width: 10.w,),
        Icon(CustomIcons.homeFill, color: AppThemes.of(context).primaryIconColor,),
        SizedBox(width: 10.w,),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: 8.r),
        title: headerStatus ? Text('详情', style: AppThemes.of(context).textTheme.titleMedium,) : const Text(''),
        centerTitle: true,
        background: buildAppBarBackground(context),
      ),
    );
  }

  ///渲染背景部分布局
  Widget buildAppBarBackground(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://static.runoob.com/images/demo/demo2.jpg'),
                fit: BoxFit.fitHeight
            )
          ),
        ),
       
      ],
    );
  }
}

class GoodsDetail2 extends StatelessWidget {

  final ScrollController scrollController = ScrollController();

  GoodsDetail2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget> [
            HeaderSliverWidget(scrollController: scrollController)
          ];
        },
        body: buildSliverBody(context)
      ),
    );
  }
  
  
  /// 异步请求数据
  Future<void> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }


  Widget buildSliverBody(BuildContext context){
    return CustomScrollFadePage2(
        fetchData: fetchData,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10).r,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text('设计的礼服建设力度肌肤', style: AppThemes.of(context).textTheme.labelLarge,),
                  Text('1223.33元', style: AppThemes.of(context).textTheme.titleLarge,),
                  Text('44402预计水电费水电费爱上 -副色', style: AppThemes.of(context).textTheme.labelMedium,),
                  Divider(color: AppThemes.of(context).divideColor,height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('销售+1000', style: AppThemes.of(context).textTheme.displayMedium,),
                      Text('好评+1000', style: AppThemes.of(context).textTheme.displayMedium,),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: AppThemes.of(context).divideColor,height: 0.h,),
                  ListTile(
                    dense: true,
                  
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('颜色', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      // Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('品牌', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 5.h),
                    title: Text('品牌', style: AppThemes.of(context).textTheme.labelMedium,),
                    trailing: Icon(Icons.keyboard_arrow_right, color: AppThemes.of(context).labelIconColor,),
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                  
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryColor,
                      // padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      borderRadius: BorderRadius.circular(30.r),
                      // minSize: 35,
                      child: Text('加入购物车', style: TextStyle(fontSize: 14, color: AppThemes.of(context).primaryAccentColor),),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: AppThemes.of(context).primaryColor
                      )
                    ),
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppThemes.of(context).primaryAccentColor,
                      padding: const EdgeInsets.symmetric(vertical: 0,),
                      borderRadius: BorderRadius.circular(30.r),
                      // minSize: 35,
                      child: Text('立即购买', style: TextStyle(fontSize: 14, color: AppThemes.of(context).primaryColor),),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: double.infinity,
                    child: Text('关于商品',textAlign: TextAlign.center, style: AppThemes.of(context).textTheme.titleMedium,),
                  ),
                  Text('规格', style: AppThemes.of(context).textTheme.titleSmall,),
                  Text('规格-1', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-2', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-3', style: AppThemes.of(context).textTheme.displayMedium,),
                  Text('规格-4', style: AppThemes.of(context).textTheme.displayMedium,),
                  // Divider(color: AppThemes.of(context).divideColor,height: 30.h,),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,),
                  Image.network('https://static.runoob.com/images/demo/demo2.jpg',fit: BoxFit.cover,)
                ],
              ),
            ),
          )
        ],
      );
  }

}