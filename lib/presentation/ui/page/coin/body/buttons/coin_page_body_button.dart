import 'package:flutter/material.dart';

class CoinPageBodyButton extends StatelessWidget {
  final String imageAsset;

  final Color? color;

  final EdgeInsets? margin;

  const CoinPageBodyButton(
      {Key? key, required this.imageAsset, this.color, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 65,
          height: 65,
          color: color ?? Colors.white,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, top: 18, right: 17, bottom: 17),
                  child: Image.asset(imageAsset, width: 30, height: 30)),
            ),
          ),
        ),
      ),
    );
  }
}
