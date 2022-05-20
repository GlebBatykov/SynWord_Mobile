import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/sliders/slider_cubit/slider_cubit.dart';
import '../layer/animated_layer/rephrase_animated_layer.dart';
import 'slider_error_icon.dart';
import 'slider_properties.dart';

class LeftSlider extends StatelessWidget {
  const LeftSlider({Key? key}) : super(key: key);

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
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  state.onHorizontalDragUpdate(details.delta);
                },
                onHorizontalDragEnd: (details) {
                  state.onHorizontalDragEnd(details.primaryVelocity ?? 0);
                },
                child: AnimatedOpacity(
                  opacity: state.opacity,
                  duration: state.duration,
                  onEnd: state.onOpacityAnimationEnd,
                  curve: Curves.easeOut,
                  child: Container(
                      height: 302,
                      width: SliderProperties.sliderWidth,
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
                          : Container()),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
              top: state.layerOffset.dy + coordinate.top,
              left: coordinate.left + -(state.layerSize.width) + 50,
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
