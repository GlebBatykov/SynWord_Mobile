import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/button/rounded/rounded_button.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        iconData: Icons.arrow_back,
        onTap: () {
          Poseidon.pop();
        });
  }
}
