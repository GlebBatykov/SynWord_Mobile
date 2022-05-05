import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../model/layer/text_input_layer/length_borders.dart';
import '../layer/layers_canvas/layers_canvas_cubit.dart';
import '../layer/text_input_layer/text_input_layer_cubit.dart';
import '../sliders/sliders_cubit/sliders_cubit.dart';

part 'body_state.dart';

class BodyCubit extends Cubit<BodyState> {
  final Size _size;

  late final LengthBorders _textLengthBorders;

  late final LayersCanvasCubit _canvasCubit;

  final SlidersCubit _slidersCubit = SlidersCubit();

  BodyCubit(Size size)
      : _size = size,
        super(BodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _textLengthBorders = LengthBorders(100, 10000);

    var inputLayerCubit = TextInputLayerCubit(_textLengthBorders);

    _canvasCubit = LayersCanvasCubit(_size, inputLayerCubit);

    _canvasCubit.textChanges.listen(_handleTextChange);

    emit(BodyShow(_canvasCubit, _slidersCubit));
  }

  void _handleTextChange(int length) {
    if (length <= _textLengthBorders.min) {
      _slidersCubit.lockSliders();
    } else {
      _slidersCubit.unlockSliders();
    }
  }
}
