import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/layer/text_input_layer/length_borders.dart';
import '../layer/text_input_layer/text_input_layer_cubit.dart';
import '../sliders/sliders_cubit/sliders_cubit.dart';

part 'body_state.dart';

class BodyCubit extends Cubit<BodyState> {
  late final LengthBorders _textLengthBorders;

  late final TextInputLayerCubit _inputLayerCubit;

  final SlidersCubit _slidersCubit = SlidersCubit();

  BodyCubit() : super(BodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _textLengthBorders = LengthBorders(100, 10000);

    _inputLayerCubit = TextInputLayerCubit(_textLengthBorders);

    _inputLayerCubit.textChanges.listen(_handleTextChange);

    emit(BodyShow(_inputLayerCubit, _slidersCubit));
  }

  void _handleTextChange(int length) {
    if (length <= _textLengthBorders.min) {
      _slidersCubit.lockSliders();
    } else {
      _slidersCubit.unlockSliders();
    }
  }
}
