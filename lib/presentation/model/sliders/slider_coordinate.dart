class SliderCoordinate {
  final double left;

  final double right;

  final double bottom;

  final double top;

  SliderCoordinate({double? left, double? right, double? bottom, double? top})
      : left = left ?? 0,
        right = right ?? 0,
        bottom = bottom ?? 0,
        top = top ?? 0;
}
