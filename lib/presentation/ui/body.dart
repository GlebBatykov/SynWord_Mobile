import 'package:flutter/material.dart';

import 'appbar/appbar.dart';
import 'sliders/sliders.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbar(),
        Expanded(
            child: Stack(
          children: [Sliders()],
        ))
      ],
    );
  }
}
