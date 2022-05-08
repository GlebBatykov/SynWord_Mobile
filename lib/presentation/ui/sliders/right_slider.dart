import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/ui/material_container.dart';

import '../../cubit/sliders/slider_cubit/slider_cubit.dart';
import 'slider_error_icon.dart';

class RightSlider extends StatelessWidget {
  const RightSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(builder: (context, state) {
      return MaterialContainer(
          onTap: () {},
          height: 302,
          width: 60,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(-6, 0),
                blurRadius: 6)
          ],
          color: HexColor('#E8CAA0'),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.elliptical(35, 150),
              bottomLeft: Radius.elliptical(35, 150)),
          child: state is SliderLock
              ? Stack(children: const [
                  Positioned.fill(
                      left: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SliderErrorIcon(),
                      ))
                ])
              : Container());
    });
  }
}
