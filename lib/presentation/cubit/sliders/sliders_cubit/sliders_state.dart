part of 'sliders_cubit.dart';

@immutable
abstract class SlidersState {
  const SlidersState();
}

class SlidersInitial extends SlidersState {
  const SlidersInitial();
}

class SlidersShow extends SlidersState {
  final SliderCubit leftSliderCubit;

  final SliderCubit rightSliderCubit;

  final bool isLeftSliderEnabled;

  final bool isRightSliderEnabled;

  const SlidersShow(this.leftSliderCubit, this.rightSliderCubit,
      this.isLeftSliderEnabled, this.isRightSliderEnabled);
}
