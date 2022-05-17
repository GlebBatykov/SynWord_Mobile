import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/sliders/slider_coordinate.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  double _opacity = 1;

  SliderCoordinate _coordinate;

  SliderCubit(SliderCoordinate coordinate)
      : _coordinate = coordinate,
        super(SliderInitial()) {
    _initialize();
  }

  void _initialize() {
    unlock();
  }

  void lock() {
    emit(SliderLock(_opacity, _coordinate));
  }

  void unlock() {
    emit(SliderUnlock(_opacity, _coordinate));
  }

  void changeOpacity(double opacity) {
    _opacity = opacity;
  }
}
