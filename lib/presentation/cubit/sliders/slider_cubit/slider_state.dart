part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

abstract class SliderShow extends SliderState {
  final double opacity;

  final SliderCoordinate coordinate;

  final Duration duration;

  final void Function(Offset) onHorizontalDragUpdate;

  final void Function(double) onHorizontalDragEnd;

  SliderShow(this.opacity, this.coordinate, this.duration,
      this.onHorizontalDragUpdate, this.onHorizontalDragEnd);
}

class SliderUnlock extends SliderShow {
  SliderUnlock(super.opacity, super.coordinate, super.duration,
      super.onHorizontalDragUpdate, super.onHorizontalDragEnd);
}

class SliderLock extends SliderShow {
  SliderLock(super.opacity, super.coordinate, super.duration,
      super.onHorizontalDragUpdate, super.onHorizontalDragEnd);
}
