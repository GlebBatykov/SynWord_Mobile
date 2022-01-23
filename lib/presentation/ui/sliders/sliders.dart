import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders_cubit/sliders_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/sliders/right_slider.dart';

import 'left_slider.dart';

class Sliders extends StatelessWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<SlidersCubit, SlidersState>(builder: (context, state) {
          return Visibility(
              visible: state.isLeftSliderEnabled,
              child: const Positioned.fill(
                  left: -36,
                  bottom: 50,
                  child: Align(
                      alignment: Alignment.bottomLeft, child: LeftSlider())));
        }),
        BlocBuilder<SlidersCubit, SlidersState>(builder: (context, state) {
          return Visibility(
              visible: state.isRightSliderEnabled,
              child: const Positioned.fill(
                  right: -36,
                  bottom: 50,
                  child: Align(
                      alignment: Alignment.bottomRight, child: RightSlider())));
        })
      ],
    );
  }
}
