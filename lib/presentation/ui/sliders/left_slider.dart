import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders/slider_cubit/slider_cubit.dart';

import 'slider_error_icon.dart';

class LeftSlider extends StatelessWidget {
  const LeftSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(builder: (context, state) {
      return Container(
          height: 302,
          width: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(6, 0),
                  blurRadius: 6)
            ],
            color: HexColor('#E8CAA0'),
            borderRadius: const BorderRadius.only(
                topRight: Radius.elliptical(35, 150),
                bottomRight: Radius.elliptical(35, 150)),
          ),
          child: state is SliderLock
              ? Stack(
                  children: const [
                    Positioned.fill(
                        right: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SliderErrorIcon(),
                        ))
                  ],
                )
              : Container());
    });
  }
}
