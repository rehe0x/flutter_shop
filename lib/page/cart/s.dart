import 'package:flutter/material.dart';
import 'package:flutter_shop/common/screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/common/sticky_headers/sticky_headers.dart';
import 'package:flutter_shop/page/cart/cart.dart';
import 'package:flutter_shop/theme/themes.dart';

class StickyHeadersDemo1 extends StatefulWidget {
	StickyHeadersDemo1({Key? key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<StickyHeadersDemo1> {

	List<String> imgs=[
		'https://static.runoob.com/images/demo/demo2.jpg',
	'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
  'https://static.runoob.com/images/demo/demo2.jpg',
	];
	

  Widget initSliverAppBar() {
    return SliverAppBar(
      // toolbarHeight: 100.h,
      title: Text(
        "flutter",
        style: TextStyle(color: Colors.black),
      ),
      //左侧按钮
      leading: CloseButton(),
      //滑动高度
      // expandedHeight: 230.0,
      //当snap = true时 这个参数必须为true!!!
      floating: false,

      //AppBar固定
      pinned: false,

      //AppBar跟随手指滑动而滑动  floating必须为true才可以使用
      snap: false,

      //滑动背景
      // flexibleSpace: new FlexibleSpaceBar(
      //   // background: Image.asset(
      //   //   "assets/images/flutter.jpg",
      //   //   fit: BoxFit.fill,
      //   // ),

      //   // titlePadding: EdgeInsets.only(left: 60),

      //   title: new Text(
      //     "android",
      //     style: TextStyle(color: Colors.black),
      //   ),

      //   //标题居中
      //   centerTitle: true,

      //   //滑动模式  CollapseMode.parallax,
      //   //          CollapseMode.none,
      //   collapseMode: CollapseMode.pin,
      // ),

      //背景颜色
      backgroundColor: AppThemes.of(context).primaryBackgroundColor,

    

      //AppBar是否在状态栏下面
      primary: false,

      //标题(title)是否居中
      centerTitle: false,
      // bottom: PreferredSizeWidget(),
      // //右侧Widget操作
      // actions: initAppBarRightIcon(),
    );
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			// appBar: AppBar(
			// 	title: Text("sticky_headers"),
      //   elevation: 0.0,
			// ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
               SliverAppBar(
              backgroundColor: AppThemes.of(context).primaryBackgroundColor,
              elevation: 0.0,
              // appbar高度
              toolbarHeight: 0.h,
              // 总高度 
              expandedHeight: 30.h,
              // 固定导航栏
              // pinned: true,
              // 滑动一点导航栏就显示 否则滑倒最顶部
              floating: false,
              // collapsedHeight: 31.h,
              // bottom: AppBar(
              //   title: Text('sdf'),
              // ),
              // 导航栏显示动画效果 不管滑动多少自动弹出显示
              // snap: true,
              // FlexibleSpaceBar是否和导航固定
              // stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                // 拉动伸缩比例
                expandedTitleScale: 1,
                
                // title: SearchField(height: 40.h, readOnly: true,),
                // title: Text('sdfs',style: AppThemes.of(context).textTheme.titleLarge,),
                
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 0.r, top: 30,left: 15.r, right: 15.r),
                background: SafeArea(
                  
                  // top: false,
                  // minimum: EdgeInsets.only(top: 44.h),
                  child: Text(
                    'title',
                    textAlign: TextAlign.center,
                    style: AppThemes.of(context).textTheme.titleLarge.copyWith(color: AppThemes.of(context).primaryColor)
                  ),
                ),
              ),
            ),
        
          ];
        },
        body: Scaffold(
          // appBar: AppBar(title: Text('sdf', style: TextStyle(color: Colors.red),), toolbarHeight: 10,elevation: 0, backgroundColor: Colors.white,),
          // top: false,
          // minimum: EdgeInsets.only(top: 40),
          body: CustomScrollView(
            slivers: [
            //   SliverAppBar(
            //   backgroundColor: AppThemes.of(context).primaryBackgroundColor,
            //   elevation: 0.0,
            //   // appbar高度
            //   toolbarHeight: 45.h,
            //   // 总高度 
            //   expandedHeight: 100.h,
            //   // 固定导航栏
            //   pinned: true,
            //   // 滑动一点导航栏就显示 否则滑倒最顶部
            //   floating: false,
            //   // 导航栏显示动画效果 不管滑动多少自动弹出显示
            //   // snap: true,
            //   // FlexibleSpaceBar是否和导航固定
            //   stretch: false,
            //   flexibleSpace: FlexibleSpaceBar(
            //     // 拉动伸缩比例
            //     expandedTitleScale: 1,
            //     // title: SearchField(height: 40.h, readOnly: true,),
            //     title: Text('sdfs'),
            //     centerTitle: true,
            //     titlePadding: EdgeInsets.only(bottom: 2.r, left: 15.r, right: 15.r),
            //     background: SafeArea(
            //       // top: false,
            //       // minimum: EdgeInsets.only(top: 44.h),
            //       child: Text(
            //         'title',
            //         textAlign: TextAlign.center,
            //         style: AppThemes.of(context).textTheme.titleLarge.copyWith(color: AppThemes.of(context).primaryColor)
            //       ),
            //     ),
            //   ),
            // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, index) {
                    return StickyHeader(
                      overlapHeaders: false,
                      header: Container(
                        height: 50.0,
                        color: Colors.blueGrey[700],
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('Header #$index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      content: Container(
                        height: 300.0 - (index*2) ,
                        child: Image.network('https://static.runoob.com/images/demo/demo2.jpg', fit: BoxFit.cover,width: double.infinity, height: 200.0),
                      ),
                    );
                  },
                  childCount: 60
                ),
                // itemExtent: 300.h,
              )
            ],
          ),
        ),
      ),
			// body: ListView.builder(
			// 	itemCount: 12,
			// 	itemBuilder: (context, index) {
			// 		return StickyHeader(
      //       overlapHeaders: true,
			// 			header: Container(
			// 				height: 50.0,
			// 				color: Colors.blueGrey[700],
			// 				padding: EdgeInsets.symmetric(horizontal: 16.0),
			// 				alignment: Alignment.centerLeft,
			// 				child: Text('Header #$index',
			// 					style: const TextStyle(color: Colors.white),
			// 				),
			// 			),
			// 			content: Container(
			// 				child: Image.network(imgs[index], fit: BoxFit.cover,width: double.infinity, height: 200.0),
			// 			),
			// 		);
			// 	}
			// )
		);
	}
}