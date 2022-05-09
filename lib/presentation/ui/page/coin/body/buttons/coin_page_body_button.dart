import 'package:flutter/material.dart';

import '../../../../material_container.dart';

class CoinPageBodyButton extends StatelessWidget {
  final String imageAsset;

  final Color? color;

  final EdgeInsets? margin;

  final void Function()? onTap;

  const CoinPageBodyButton(
      {Key? key, required this.imageAsset, this.color, this.margin, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      onTap: onTap,
      margin: margin,
      boxShadow: [
        BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25))
      ],
      borderRadius: BorderRadius.circular(5),
      color: color ?? Colors.white,
      child: Padding(
          padding:
              const EdgeInsets.only(left: 18, top: 18, right: 17, bottom: 17),
          child: Image.asset(imageAsset, width: 30, height: 30)),
    );
  }
}
