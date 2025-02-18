import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoaderClassic extends StatefulWidget {
  final bool? animating;

  final double? radius;

  final int? tickCount;

  final Color? activeColor;

  final Duration animationDuration;

  final double relativeWidth;

  final double? startRatio = 0.5;
  final double? endRatio = 1.0;

  /// Creates a highly customizable activity indicator.
  const LoaderClassic({
    Key? key,
    this.animating = true,
    this.radius = 30,
    this.tickCount = 12,
    this.activeColor = Colors.black,
    this.animationDuration = const Duration(seconds: 1),
    this.relativeWidth = 1,
  }) : super(key: key);

  @override
  _NutsActivityIndicatorState createState() => _NutsActivityIndicatorState();
}

class _NutsActivityIndicatorState extends State<LoaderClassic>
    with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    if (widget.animating!) {
      _animationController!.repeat();
    }
  }

  @override
  void didUpdateWidget(LoaderClassic oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animating != oldWidget.animating) {
      if (widget.animating!) {
        _animationController!.repeat();
      } else {
        _animationController!.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radius! * 2,
      width: widget.radius! * 2,
      child: CustomPaint(
        painter: _NutsActivityIndicatorPainter(
          animationController: _animationController!,
          radius: widget.radius!,
          tickCount: widget.tickCount!,
          activeColor: widget.activeColor!,
          relativeWidth: widget.relativeWidth,
          startRatio: widget.startRatio!,
          endRatio: widget.endRatio!,
        ),
      ),
    );
  }
}

class _NutsActivityIndicatorPainter extends CustomPainter {
  final int _halfTickCount;
  final Animation<double> animationController;
  final Color activeColor;

  final double relativeWidth;
  final int tickCount;
  final double radius;
  final RRect _tickRRect;
  final double startRatio;
  final double endRatio;

  _NutsActivityIndicatorPainter({
    required this.radius,
    required this.tickCount,
    required this.animationController,
    required this.activeColor,
    required this.relativeWidth,
    required this.startRatio,
    required this.endRatio,
  })  : _halfTickCount = tickCount ~/ 2,
        _tickRRect = RRect.fromLTRBXY(
          -radius * endRatio,
          relativeWidth * radius / 10,
          -radius * startRatio,
          -relativeWidth * radius / 10,
          10,
          10,
        ),
        super(repaint: animationController);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas
      ..save()
      ..translate(size.width / 2, size.height / 2);
    final activeTick = (tickCount * animationController.value).floor();
    for (int i = 0; i < tickCount; ++i) {
      paint.color = Color.lerp(
        activeColor,
        activeColor.withOpacity(0.2),
        ((i + activeTick) % tickCount) / _halfTickCount,
      )!;
      canvas
        ..drawRRect(_tickRRect, paint)
        ..rotate(-math.pi * 2 / tickCount);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_NutsActivityIndicatorPainter oldPainter) {
    return oldPainter.animationController != animationController;
  }
}
