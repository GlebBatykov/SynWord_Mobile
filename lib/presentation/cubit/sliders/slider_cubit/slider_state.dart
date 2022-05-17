part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

abstract class SliderShow extends SliderState {
  final double opacity;

  final SliderCoordinate coordinate;

  SliderShow(this.opacity, this.coordinate);
}

class SliderUnlock extends SliderShow {
  SliderUnlock(super.opacity, super.coordinate);
}

class SliderLock extends SliderShow {
  SliderLock(super.opacity, super.coordinate);
}
