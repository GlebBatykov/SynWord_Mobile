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

  @override
  bool operator ==(other) {
    if (other is SliderCoordinate) {
      return left == other.left &&
          right == other.right &&
          bottom == other.bottom &&
          top == other.top;
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    var hashCode = super.hashCode;

    return hashCode;
  }
}
