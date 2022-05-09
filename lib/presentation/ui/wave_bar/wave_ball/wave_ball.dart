import 'package:flutter/material.dart';

import 'wave_ball_painter.dart';

class WaveBall extends StatefulWidget {
  final double progress;

  final double size;

  final Color foregroundColor;

  final Color backgroundColor;

  final Color circleColor;

  final Widget child;

  final double range;

  final Duration duration;

  const WaveBall({
    Key? key,
    this.size = 150.0,
    this.progress = 0.0,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.lightBlue,
    this.circleColor = Colors.grey,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.range = 10.0,
  })  : assert(progress >= 0.0 && progress <= 1.0),
        super(key: key);

  @override
  _WaveBallState createState() => _WaveBallState();
}

class _WaveBallState extends State<WaveBall> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          constraints: BoxConstraints.tightFor(
            height: widget.size,
            width: widget.size,
          ),
          child: CustomPaint(
            painter: WaveBallPainter(
              animationValue: controller.value,
              range: widget.range,
              progress: widget.progress,
              foregroundColor: widget.foregroundColor,
              backgroundColor: widget.backgroundColor,
              circleColor: widget.circleColor,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
