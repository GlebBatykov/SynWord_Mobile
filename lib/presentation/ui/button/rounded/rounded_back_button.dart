import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import 'rounded_button.dart';

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
