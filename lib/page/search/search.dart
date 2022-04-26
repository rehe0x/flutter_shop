import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/custom_icons.dart';
import 'package:flutter_shop/routes/body_delegate.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/routes/routes_model.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../provider/app_global.dart';
import '../../theme/themes.dart';
import '../../widget/search_field.dart';

///  搜索页统一头部变化
class AppBarWidget  extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({ Key? key }) : super(key: key);
  
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size(0, 45.h);
}

class _AppBarWidgetState extends State<AppBarWidget> {

  String _routeName = RoutePages.bodySearch;
  @override
  void initState() {
    AppGlobal.eventBus.on<RouteInfo>().listen((routeInfo) {
      debugPrint('_SearchState===${routeInfo.toString()}');
      setState(() {
        _routeName = routeInfo.name;
      });
    });
    super.initState();
  }

  AppBar searchFieldBar(BuildContext context) {
    return AppBar(
        title: const SearchField(height: 40),
        backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        elevation: 0.0,
      );
  }

  AppBar goodsDetailBar(BuildContext context) {
    return AppBar(
        backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        elevation: 0.0,
        leading: CupertinoButton(
                padding: const EdgeInsets.all(0),
                minSize: 0,
                child: Text('关闭', style: AppThemes.of(context).buttonTextTheme.buttonMedium,),
                onPressed: (){
                  // AppGlobal.searchRouterDelegate.pop();
                },
              ),
        title: Text('详情', style: AppThemes.of(context).textTheme.titleSmall,),
        centerTitle: true,
        actions: [
          Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
          SizedBox(width: 10.w,),
          Icon(CustomIcons.homeFill, color: AppThemes.of(context).primaryIconColor,),
          SizedBox(width: 10.w,),
          Icon(CustomIcons.cartFill, color: AppThemes.of(context).primaryIconColor,),
          SizedBox(width: 10.w,)
        ],
      );
  } 

  @override
  Widget build(BuildContext context) {
    AppBar appBarWidget = searchFieldBar(context);
    // switch (_routeName) {
    //   case RoutePages.search:
    //     appBarWidget = searchFieldBar(context);
    //     break;
    //   case RoutePages.goodsList:
    //     appBarWidget = searchFieldBar(context);
    //     break;
    //   case RoutePages.goodsDetail:
    //   appBarWidget = goodsDetailBar(context);
    //     break;
    //   default:
    //     appBarWidget = searchFieldBar(context);
    // }
    return appBarWidget;
  }
}

/// 搜索页 
class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      appBar: const AppBarWidget(),
      body: Router(
        routerDelegate: BodyRouterDelegate(initRoute: const RouteInfo(name: RoutePages.bodySearch)),
      ),
    );
  }
}

// /// 搜索页子路由
// class _SearchRoute extends StatelessWidget {
//   const _SearchRoute({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: AppGlobal.searchNavigatorKey,
//       initialRoute: 'search',
//       // 键盘事件
//       requestFocus: false,
//       onGenerateRoute: (RouteSettings settings) {
//         WidgetBuilder builder;
//         switch (settings.name) {
//           case 'search':
//             builder = (BuildContext context) =>  const SearchBody();
//             break;
//           case 'goods_item':
//             builder = (BuildContext context) => const SearchGoodsBody();
//             break;
//           default:
//             builder = (BuildContext context) => const Text('404');
//             break;
//         }
        
//         return  CupertinoPageRoute(builder: builder, settings: settings);
//       },
//     );
//   }
// }

