import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/body.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/drawer_menu/drawer_menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GetIt.instance<Poseidon>().scaffoldKey,
      drawer: const DrawerMenu(),
      backgroundColor: HexColor('#301B28'),
      resizeToAvoidBottomInset: false,
      body: const Body(),
    );
  }
}
