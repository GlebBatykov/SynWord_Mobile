import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword/presentation/ui/body.dart';
import 'package:synword/presentation/ui/drawer_menu/drawer_menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Poseidon.instance.scaffoldKey,
      drawer: const DrawerMenu(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: HexColor('#301B28'),
      resizeToAvoidBottomInset: false,
      body: const Body(),
    );
  }
}
