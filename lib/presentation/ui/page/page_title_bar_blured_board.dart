import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class PageTitleBarBluredBoard extends StatelessWidget {
  final double width;

  final Widget? child;

  final Color? color;

  final Gradient? gradient;

  final double? blurOpacity;

  const PageTitleBarBluredBoard(
      {Key? key,
      this.child,
      this.width = 136,
      this.color,
      this.gradient,
      this.blurOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 80,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 15,
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: Stack(
          children: [
            Container(
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 6, top: 8),
                    decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(15)))
                .blurred(
                    blur: 15,
                    borderRadius: BorderRadius.circular(15),
                    blurColor: Colors.white,
                    colorOpacity: blurOpacity ?? 0),
            child ?? Container()
          ],
        ));
  }
}
