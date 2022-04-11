import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/search/search_body.dart';
import 'package:flutter_shop/page/search/search_goods.dart';
import 'package:provider/provider.dart';
import '../../provider/navigation_bar.dart';
import '../../widget/search_field.dart';
class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchField(height: 40, autofocus: true),
      ),
      body: const _SearchRoute()
    );
  }
}


class _SearchRoute extends StatelessWidget {
  const _SearchRoute({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'search',
      // 键盘事件
      requestFocus: false,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'search':
            builder = (BuildContext context) =>  const SearchBody();
            break;
          case 'goods_item':
            builder = (BuildContext context) => const SearchGoodsBody();
            break;
          default:
            builder = (BuildContext context) => const Text('404');
            break;
        }
        
        return  CupertinoPageRoute(builder: builder, settings: settings);
      },
    );
  }
}