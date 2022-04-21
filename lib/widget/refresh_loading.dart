import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:flutter_shop/widget/animated.dart';

/// 下拉刷新 动画
class RefreshAnimated extends StatelessWidget {
  final Future<void> Function() fetchData;
  const RefreshAnimated({required this.fetchData, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      refreshTriggerPullDistance: 100.0, ///触发刷新的距离
      refreshIndicatorExtent: 40.0, /// 刷新过程中悬浮高度
      /// 根据 刷新状态和距离返回一个Widget ,这个就是自定义的布局
      builder: (context,buildRefreshindictor,pulledExtent,refreshTriggerPullDistance,refreshIndicatorExtent){
        return Container(
          height: 40.h,
          alignment: Alignment.center,
            child: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: pulledExtent.round() > 40 ? 1.0 : 0.0,
            // opacity: 1.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.r,
                  width: 25.r,
                  child: RingInsideLoading(
                    color: AppThemes.of(context).primaryColor,
                    backgroundColor: AppThemes.of(context).scaffoldAccentColor,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.linear,
                    strokeWidth: 3.r,
                  ),
                ),
                // Text(RefreshIndicatorMode.done==buildRefreshindictor?   '已拉动:${pulledExtent.round()}  松开刷新':  '已拉动:${pulledExtent.round()}  下拉刷新',
                //   style: const TextStyle(fontSize: 14.0),
                // ),
              ]
            )
          ),
        );
      },
      ///触发刷新回调
      onRefresh: fetchData
    );
  }
}


/// 封装加载动画页面&下拉刷新
class CustomScrollFadePage extends StatefulWidget {
  /// 异步请求数据
  final Future<void> Function() fetchData;
  /// slivers 列表
  final List<Widget> slivers;

  const CustomScrollFadePage({
    Key? key,
    required this.fetchData,
    required this.slivers,
  }) : super(key: key);

  @override
  State<CustomScrollFadePage> createState() => _CustomScrollFadePageState();
}

class _CustomScrollFadePageState extends State<CustomScrollFadePage> {
  /// 是否加载动画 下拉刷新不加载动画 
  bool _load = true;

  @override
  void initState() {
    debugPrint('snapshot-----initState-----');
    super.initState();
  }
  ///当以来的State对象改变时会调用
  @override
  void didChangeDependencies() {
    debugPrint('snapshot------didChangeDependencies-------');
    super.didChangeDependencies();
  }
  ///这是一个不常用到的生命周期方法，当父组件需要重新绘制时才会调用；
  @override
  void didUpdateWidget(CustomScrollFadePage oldWidget) {
    /// 父组件筛选显示加载动画
    _load = true;
    debugPrint('snapshot--------didUpdateWidget---------');
    super.didUpdateWidget(oldWidget);
  }
  ///很少使用，在组件被移除时候调用，在dispose之前调用
  @override
  void deactivate() {
    debugPrint('snapshot--------deactivate----------');
    super.deactivate();
  }
  ///常用，组件被销毁时候调用；
  ///通常在该方法中执行一些资源的释放工作，比如监听器的移除，channel的销毁等；
  @override
  void dispose() {
    debugPrint('snapshot--------dispose---------');
    super.dispose();
  }

  /// 流程控制 淡入效果
  Stream<Widget> fetchStream() async* {
    debugPrint('fetchStream');
    if (_load){
      /// 执行异步请求
      await widget.fetchData();
      // yield Builder(builder: builder);
      /// 暂时没用
      yield const Text('加载中...');
    }
    /// 淡入效果延迟
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fetchStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        debugPrint('snapshot=${snapshot.connectionState}');
        debugPrint('snapshot=${snapshot.data}');
        debugPrint('snapshot=$_load');

        if ((snapshot.connectionState != ConnectionState.waiting) || !_load) {
          return AnimatedOpacity(
            duration:  const Duration(milliseconds: 300),
            opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              slivers: [
                /// 下拉刷新组件 执行数据请求 不加载动画
                RefreshAnimated(
                  fetchData: () async {
                    await widget.fetchData();
                    setState(() {
                      _load = false;
                    });
                  },
                ),
                ...widget.slivers
              ],
            ),
          );
        }
        /// 转圈动画
        return Center(
          child: SizedBox(
            width: 50.r,
            height: 50.r,
            child: RingInsideLoading(
              color: AppThemes.of(context).primaryColor,
              backgroundColor: AppThemes.of(context).scaffoldAccentColor,
              duration: const Duration(milliseconds: 800),
              curve: Curves.linear,
              strokeWidth: 3.r,
            ),
          ),
        );
      }
    );
  }
}