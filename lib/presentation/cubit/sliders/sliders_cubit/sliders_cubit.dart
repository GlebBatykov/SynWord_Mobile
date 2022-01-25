import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders/slider_cubit/slider_cubit.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  final SliderCubit _leftSliderCubit = SliderCubit();

  final SliderCubit _rightSliderCubit = SliderCubit();

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

  void _show() {
    emit(SlidersShow(_leftSliderCubit, _rightSliderCubit, _isLeftSliderEnabled,
        _isRightSliderEnabled));
  }
}
