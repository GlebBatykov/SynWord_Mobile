import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  final double? width;

  final double? height;

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  final Color? color;

  final List<BoxShadow>? boxShadow;

  final Widget? child;

  final BorderRadius? borderRadius;

  final void Function()? onTap;

  const MaterialContainer(
      {Key? key,
      this.child,
      this.margin,
      this.width,
      this.height,
      this.padding,
      this.color,
      this.borderRadius,
      this.boxShadow,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration:
          BoxDecoration(boxShadow: boxShadow, borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: borderRadius, color: color ?? Colors.transparent),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
