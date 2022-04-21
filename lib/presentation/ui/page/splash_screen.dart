import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../asset/icon_asset.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      body: const Center(
        child: Image(
            image: AssetImage(IconAsset.firstLogo), height: 150, width: 150),
      ),
    );
  }
}
