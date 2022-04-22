import 'package:flutter/material.dart';
import 'package:flutter_shop/page/search/search_model.dart';
import 'package:flutter_shop/routes/routes_handle.dart';
import 'package:flutter_shop/routes/routes_model.dart';
import '../../common/screenutil/src/size_extension.dart';
import '../../provider/app_global.dart';
import '../../theme/themes.dart';
import '../../widget/search_field.dart';

///  搜索页统一头部变化
class AppBarWidget extends StatefulWidget {
  const AppBarWidget({ Key? key }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  String _routeName = RoutePages.search;
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

  @override
  Widget build(BuildContext context) {
    Widget appBarWidget;
    switch (_routeName) {
      case RoutePages.search:
        appBarWidget = const SearchField(height: 40);
        break;
      case RoutePages.goodsList:
        appBarWidget = const SearchField(height: 40);
        break;
      case RoutePages.goodsDetail:
      appBarWidget = RepaintBoundary(
          child: goodsDetailBar(context),
        );
        break;
      default:
        appBarWidget = const Text('null');
    }
    return appBarWidget;
  }

  Widget goodsDetailBar(BuildContext context) {
    return Row(
    children: [
      Text('详情', style: AppThemes.of(context).textTheme.titleMedium,)
    ],
    );
  } 
}

/// 搜索页 
class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const AppBarWidget(),
        toolbarHeight: 45.h,
        backgroundColor: AppThemes.of(context).primaryBackgroundColor,
        elevation: 0.0,
      ),
      body: Router(
        routerDelegate: AppGlobal.searchRouterDelegate,
      )
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

