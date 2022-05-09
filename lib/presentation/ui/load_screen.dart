import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadScreen extends StatelessWidget {
  final String? subtitle;

  const LoadScreen({Key? key, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(bottom: 17),
          color: HexColor('#C4C4C4').withOpacity(0.7),
        ),
        const Text('Please wait...',
            style: TextStyle(fontFamily: 'Araboto-Medium')),
        if (subtitle != null)
          Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Text(subtitle!,
                  style: TextStyle(
                      fontFamily: 'Cabrion',
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.5))))
      ],
    );
  }
}
