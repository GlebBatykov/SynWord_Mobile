import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/sliders/slider_coordinate.dart';
import '../slider_cubit/slider_cubit.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  final SliderCubit _leftSliderCubit =
      SliderCubit(SliderCoordinate(left: -36, bottom: 50));

  final SliderCubit _rightSliderCubit =
      SliderCubit(SliderCoordinate(right: -36, bottom: 50));

  bool _isLeftSliderEnabled = true;

  bool _isRightSliderEnabled = true;

  SlidersCubit() : super(const SlidersInitial()) {
    _show();
  }

  void enableLeftSlider() {
    _isLeftSliderEnabled = true;
    _show();
  }

  void disableLeftSlider() {
    _isLeftSliderEnabled = false;
    _show();
  }

  void enableRightSlider() {
    _isRightSliderEnabled = true;
    _show();
  }

  void disableRightSlider() {
    _isRightSliderEnabled = false;
    _show();
  }

  void disableSliders() {
    _isLeftSliderEnabled = false;
    _isRightSliderEnabled = false;

    _show();
  }

  void enableSliders() {
    _isLeftSliderEnabled = true;
    _isRightSliderEnabled = true;

    _show();
  }

  void lockLeftSlider() {
    _leftSliderCubit.lock();
  }

  void unlockLeftSlider() {
    _leftSliderCubit.unlock();
  }

  void lockRightSlider() {
    _rightSliderCubit.lock();
  }

  void unlockRightSlider() {
    _rightSliderCubit.unlock();
  }

  void lockSliders() {
    _leftSliderCubit.lock();
    _rightSliderCubit.lock();
  }

  void unlockSliders() {
    _leftSliderCubit.unlock();
    _rightSliderCubit.unlock();
  }

  void _show() {
    emit(SlidersShow(_leftSliderCubit, _rightSliderCubit, _isLeftSliderEnabled,
        _isRightSliderEnabled));
  }
}
