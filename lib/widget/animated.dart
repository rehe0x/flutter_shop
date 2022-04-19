import 'dart:math';

import 'package:flutter/material.dart';

class RingInsideLoading extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final Duration duration;
  final Curve curve;
  final double strokeWidth;

  const RingInsideLoading({
    Key? key,
    required this.color,
    required this.backgroundColor,
    this.strokeWidth = 5.0,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.linear
  }) : super(key: key);

  @override
  State<RingInsideLoading> createState() => _RingInsideLoadingState();
}

class _RingInsideLoadingState extends State<RingInsideLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    _animation = CurveTween(curve: widget.curve).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _RingInsidePainter(
              startAngle: _animation.value * 2 * pi,
              sweepAngle: 0.3 * pi,
              strokeWidth: widget.strokeWidth,
              color: widget.color,
              backgroundColor: widget.backgroundColor),
        );
      }
    );
  }
}



class _RingInsidePainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;
  final StrokeCap strokeCap;
  final Color color;
  final Color backgroundColor;

  late Paint _paint;
  late Paint _backgroundPaint;

   _RingInsidePainter({
      required this.startAngle,
      required this.sweepAngle,
      required this.strokeWidth,
      this.strokeCap = StrokeCap.round,
      required this.color,
      required this.backgroundColor,
    }) {
    _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..color = color;

    _backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..color = backgroundColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromLTWH(0, 0, radius * 2, radius * 2), 0, 2 * pi,
        false, _backgroundPaint);

    canvas.drawArc(Rect.fromLTWH(0, 0, radius * 2, radius * 2), startAngle,
        sweepAngle, false, _paint);
  }

  @override
  bool shouldRepaint(covariant _RingInsidePainter old) {
    return color != old.color ||
        startAngle != old.startAngle ||
        sweepAngle != old.sweepAngle ||
        strokeWidth != old.strokeWidth ||
        strokeCap != old.strokeCap ||
        backgroundColor != old.backgroundColor;
  }
}
