import 'package:flutter/material.dart';
import 'package:flutter_shop/page/goods/goods_model.dart';
import 'package:flutter_shop/page/search/search_model.dart';
import 'package:flutter_shop/provider/app_global.dart';

class GoodsDetail extends StatefulWidget {
  final GoodsArgument goodsArgument;
  const GoodsDetail({ required this.goodsArgument, Key? key }) : super(key: key);

  @override
  State<GoodsDetail> createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {

  @override
  void initState() {
    // AppGlobal.eventBus.fire(SearchRoute());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('${widget.goodsArgument.goodsId}'),
    );
  }
}