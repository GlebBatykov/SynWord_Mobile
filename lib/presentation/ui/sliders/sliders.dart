import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders/slider_cubit/slider_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders/sliders_cubit/sliders_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/sliders/right_slider.dart';

import 'left_slider.dart';

class Sliders extends StatelessWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(builder: (context, state) {
      if (state is SlidersShow) {
        return Stack(
          children: [
            if (state.isLeftSliderEnabled)
              BlocProvider<SliderCubit>.value(
                  value: state.leftSliderCubit,
                  child: const Positioned(
                      left: -36,
                      bottom: 50,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: LeftSlider()))),
            if (state.isRightSliderEnabled)
              BlocProvider<SliderCubit>.value(
                  value: state.rightSliderCubit,
                  child: const Positioned(
                      right: -36,
                      bottom: 50,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: RightSlider())))
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
