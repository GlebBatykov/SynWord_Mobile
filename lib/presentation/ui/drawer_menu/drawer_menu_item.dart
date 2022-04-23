import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerMenuItem extends StatelessWidget {
  final String imageName;

  final String title;

  final void Function()? onPress;

  final EdgeInsets? padding;

  final EdgeInsets? imagePadding;

  const DrawerMenuItem(
      {Key? key,
      required this.imageName,
      required this.title,
      this.onPress,
      this.padding,
      this.imagePadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 4),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: HexColor('#b6452c'),
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: HexColor('#464646'),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  onTap: onPress,
                  child: Container(
                      padding: imagePadding,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: -3,
                            color: Color.fromRGBO(0, 0, 0, 0.25))
                      ]),
                      child: Image.asset(imageName, width: 30, height: 30)),
                ),
              ),
            ),
          ),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: 'Isidora-Soft-Alt'))
        ],
      ),
    );
  }
}
