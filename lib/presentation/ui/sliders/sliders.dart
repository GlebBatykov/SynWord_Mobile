import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/sliders/right_slider.dart';

import 'left_slider.dart';

class Sliders extends StatelessWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned.fill(
            left: -36,
            bottom: 50,
            child: Align(alignment: Alignment.bottomLeft, child: LeftSlider())),
        Positioned.fill(
            right: -36,
            bottom: 50,
            child:
                Align(alignment: Alignment.bottomRight, child: RightSlider()))
      ],
    );
  }
}
