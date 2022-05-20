import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/sliders/slider_cubit/slider_cubit.dart';
import '../layer/animated_layer/rephrase_animated_layer.dart';
import 'slider_error_icon.dart';
import 'slider_properties.dart';

class RightSlider extends StatelessWidget {
  const RightSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(builder: (context, state) {
      if (state is SliderShow) {
        var coordinate = state.coordinate;

        return Stack(children: [
          AnimatedPositioned(
            left: coordinate.left,
            bottom: coordinate.bottom,
            top: coordinate.top,
            right: coordinate.right,
            duration: state.duration,
            onEnd: state.onPositionedAnimationEnd,
            curve: Curves.easeOut,
            child: Align(
                alignment: Alignment.bottomRight,
                child: AnimatedOpacity(
                  opacity: state.opacity,
                  duration: state.duration,
                  onEnd: state.onOpacityAnimationEnd,
                  curve: Curves.easeOut,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      state.onHorizontalDragUpdate(details.delta);
                    },
                    onHorizontalDragEnd: (details) {
                      state.onHorizontalDragEnd(details.primaryVelocity ?? 0);
                    },
                    child: Container(
                        height: 302,
                        width: SliderProperties.sliderWidth,
                        decoration: BoxDecoration(
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
                        ),
                        child: state is SliderLock
                            ? Stack(children: const [
                                Positioned.fill(
                                    left: 2,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SliderErrorIcon(),
                                    ))
                              ])
                            : Container()),
                  ),
                )),
          ),
          AnimatedPositioned(
              top: state.layerOffset.dy + coordinate.top,
              right: coordinate.right + -(state.layerSize.width) + 50,
              duration: state.duration,
              onEnd: state.onPositionedAnimationEnd,
              curve: Curves.easeOut,
              child: Align(
                alignment: Alignment.center,
                child: RephraseAnimatedLayer(size: state.layerSize),
              ))
        ]);
      } else {
        return Container();
      }
    });
  }
}
