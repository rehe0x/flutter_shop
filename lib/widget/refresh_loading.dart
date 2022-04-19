import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/common/screenutil/src/size_extension.dart';
import 'package:flutter_shop/theme/themes.dart';
import 'package:flutter_shop/widget/animated.dart';

/// 下拉刷新 动画
class RefreshAnimated extends StatelessWidget {
  const RefreshAnimated({ Key? key }) : super(key: key);

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
      onRefresh: () async {
        await Future<void>.delayed(const Duration(milliseconds: 1000));
      },
    );
  }
}