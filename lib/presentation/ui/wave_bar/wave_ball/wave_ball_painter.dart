import 'package:flutter/material.dart';

class WaveBallPainter extends CustomPainter {
  final double progress;

  final double animationValue;

  final double range;

  final Color foregroundColor;

  final Color backgroundColor;

  final Color circleColor;

  final int waveCount;

  WaveBallPainter(
      {required this.foregroundColor,
      required this.circleColor,
      required this.backgroundColor,
      this.animationValue = 0,
      this.progress = 0.0,
      this.range = 10.0,
      this.waveCount = 4})
      : assert(animationValue >= 0.0 && animationValue <= 1.0),
        assert(progress >= 0.0 && progress <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    var levelHeight = (1.0 - progress) * size.height;
    var specWidget = size.width / waveCount;
    var translateX = size.width * animationValue;
    var translateX2 = size.width * (1 - animationValue);

    var path = Path();

    path.moveTo(0 - translateX, size.height);
    path.lineTo(0 - translateX, levelHeight);

    for (int i = 1; i <= waveCount; i++) {
      var controllerX = specWidget * (i * 2 - 1) - translateX;
      var controllerY = i % 2 == 0 ? levelHeight - range : levelHeight + range;
      var toX = specWidget * (2 * i) - translateX;
      path.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }

    path.lineTo(size.width + translateX, size.height);
    path.close();

    var path2 = Path();

    path2.moveTo(0 - translateX2, size.height);
    path2.lineTo(0 - translateX2, levelHeight);

    for (var i = 1; i <= waveCount; i++) {
      var controllerX = specWidget * (i * 2 - 1) - translateX2;
      var controllerY = i % 2 != 0 ? levelHeight - range : levelHeight + range;
      var toX = specWidget * (2 * i) - translateX2;

      path2.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path2.lineTo(size.width + translateX2, size.height);
    path2.close();

    var path3 = Path();

    path3.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    path3.close();

    canvas.clipPath(path3, doAntiAlias: true);

    var mPaint = Paint();

    mPaint.style = PaintingStyle.fill;
    mPaint.isAntiAlias = true;

    mPaint.color = circleColor;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);

    mPaint.color = backgroundColor;
    canvas.drawPath(path2, mPaint);

    mPaint.color = foregroundColor;
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(WaveBallPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.range != range ||
        oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.foregroundColor != foregroundColor ||
        oldDelegate.circleColor != circleColor;
  }
}
