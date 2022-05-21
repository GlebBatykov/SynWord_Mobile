part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

abstract class SliderShow extends SliderState {
  final AnimatedLayerType layerType;

  final Size layerSize;

  final Offset layerOffset;

  final double opacity;

  final SliderCoordinate coordinate;

  final Duration duration;

  final void Function(Offset) onHorizontalDragUpdate;

  final void Function(double) onHorizontalDragEnd;

  final void Function() onOpacityAnimationEnd;

  final void Function() onPositionedAnimationEnd;

  SliderShow(
      this.layerType,
      this.layerSize,
      this.layerOffset,
      this.opacity,
      this.coordinate,
      this.duration,
      this.onHorizontalDragUpdate,
      this.onHorizontalDragEnd,
      this.onOpacityAnimationEnd,
      this.onPositionedAnimationEnd);
}

class SliderUnlock extends SliderShow {
  SliderUnlock(
      super.layerType,
      super.layerSize,
      super.layerOffset,
      super.opacity,
      super.coordinate,
      super.duration,
      super.onHorizontalDragUpdate,
      super.onHorizontalDragEnd,
      super.onOpacityAnimationEnd,
      super.onPositionedAnimationEnd);
}

class SliderLock extends SliderShow {
  SliderLock(
      super.layerType,
      super.layerSize,
      super.layerOffset,
      super.opacity,
      super.coordinate,
      super.duration,
      super.onHorizontalDragUpdate,
      super.onHorizontalDragEnd,
      super.onOpacityAnimationEnd,
      super.onPositionedAnimationEnd);
}
