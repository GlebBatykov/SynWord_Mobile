import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String assetPath;

  final double? width;

  final double? height;

  final double? imageWidth;

  final double? imageHeight;

  final void Function()? onTap;

  final Color? color;

  const ImageButton(
      {Key? key,
      required this.assetPath,
      this.width,
      this.height,
      this.imageHeight,
      this.imageWidth,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17.5),
      child: Container(
        padding: EdgeInsets.zero,
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
              splashRadius: 30,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onTap,
              icon: Image.asset(
                assetPath,
                width: imageWidth,
                height: imageHeight,
                color: color,
              )),
        ),
      ),
    );
  }
}
