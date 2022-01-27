import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DrawerMenuItem extends StatelessWidget {
  final String imageName;

  final String title;

  final void Function()? onPress;

  final EdgeInsets padding;

  const DrawerMenuItem(
      {Key? key,
      required this.imageName,
      required this.title,
      this.onPress,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.only(bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor('#b6452c'),
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: HexColor('#464646'),
                    borderRadius: BorderRadius.circular(25)),
                child: IconButton(
                    onPressed: onPress,
                    icon: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 3,
                              spreadRadius: -3,
                              color: Color.fromRGBO(0, 0, 0, 0.25))
                        ]),
                        child: Image.asset(imageName)),
                    iconSize: 30),
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
