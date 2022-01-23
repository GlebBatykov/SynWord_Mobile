import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LeftSlider extends StatelessWidget {
  const LeftSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 302,
        width: 60,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(6, 0),
                blurRadius: 6)
          ],
          color: HexColor('#E8CAA0'),
          borderRadius: const BorderRadius.only(
              topRight: Radius.elliptical(35, 150),
              bottomRight: Radius.elliptical(35, 150)),
        ));
  }
}
