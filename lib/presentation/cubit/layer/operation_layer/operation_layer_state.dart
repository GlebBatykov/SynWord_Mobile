part of 'operation_layer.dart';

@immutable
abstract class OperationLayerState {
  const OperationLayerState();
}

class OperationLayerInitial extends OperationLayerState {}

class OperationLayerShow extends OperationLayerState {
  final Offset offset;

  final Size size;

  final Duration duration;

  final void Function() onAnimationEnd;

  final OperationLayerHeaderCubit headerCubit;

  final OperationLayerBodyCubit bodyCubit;

  const OperationLayerShow(this.headerCubit, this.bodyCubit, this.offset,
      this.size, this.duration, this.onAnimationEnd);
}
