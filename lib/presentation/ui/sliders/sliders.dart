import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sliders/slider_cubit/slider_cubit.dart';
import '../../cubit/sliders/sliders_cubit/sliders_cubit.dart';
import 'left_slider.dart';
import 'right_slider.dart';

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
                  value: state.leftSliderCubit, child: const LeftSlider()),
            if (state.isRightSliderEnabled)
              BlocProvider<SliderCubit>.value(
                  value: state.rightSliderCubit, child: const RightSlider())
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
