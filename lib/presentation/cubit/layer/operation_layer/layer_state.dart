part of 'operation_layer.dart';

@immutable
abstract class OperationLayerState {
  final Offset offset;

  final Size size;

  const OperationLayerState(this.offset, this.size);
}

class OperationLayerInitial extends OperationLayerState {
  const OperationLayerInitial(Offset offset, Size size) : super(offset, size);
}

class OperationLayerPreparation extends OperationLayerState {
  const OperationLayerPreparation(Offset offset, Size size)
      : super(offset, size);
}

class OperationLayerShow extends OperationLayerState {
  final OperationLayerHeaderCubit headerCubit;

  final OperationLayerBodyCubit bodyCubit;

  const OperationLayerShow(
      this.headerCubit, this.bodyCubit, Offset offset, Size size)
      : super(offset, size);
}
