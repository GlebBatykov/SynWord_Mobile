import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/appbar/appbar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Appbar(), Expanded(child: Stack())],
    );
  }
}
