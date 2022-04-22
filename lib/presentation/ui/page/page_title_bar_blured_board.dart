import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PageTitleBarBluredBoard extends StatelessWidget {
  final double width;

  final Widget? child;

  const PageTitleBarBluredBoard({Key? key, this.child, this.width = 136})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 80,
        decoration: BoxDecoration(
            color: HexColor('#634357'),
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
                        gradient: LinearGradient(
                            colors: [HexColor('#C0392B'), HexColor('#8E44AD')]),
                        borderRadius: BorderRadius.circular(15)))
                .blurred(
                    blur: 15,
                    borderRadius: BorderRadius.circular(15),
                    blurColor: Colors.white,
                    colorOpacity: 0.12),
            child ?? Container()
          ],
        ));
  }
}
