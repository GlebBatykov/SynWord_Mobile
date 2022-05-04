part of 'layer_cubit.dart';

@immutable
abstract class LayerState {
  final Offset offset;

  final Size size;

  const LayerState(this.offset, this.size);
}

class LayerInitial extends LayerState {
  const LayerInitial(Offset offset, Size size) : super(offset, size);
}

class LayerShow extends LayerState {
  final LayerHeaderCubit headerCubit;

  final LayerBodyCubit bodyCubit;

  const LayerShow(this.headerCubit, this.bodyCubit, Offset offset, Size size)
      : super(offset, size);
}
