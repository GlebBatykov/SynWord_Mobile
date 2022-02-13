import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      body: const Center(
        child: Image(
            image: AssetImage('assets/images/first_logo.png'),
            height: 150,
            width: 150),
      ),
    );
  }
}
