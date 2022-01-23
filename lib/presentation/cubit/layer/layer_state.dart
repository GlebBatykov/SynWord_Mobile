part of 'layer_cubit.dart';

@immutable
abstract class LayerState {
  final Size size;

  const LayerState(this.size);
}

class LayerInitial extends LayerState {
  const LayerInitial(Size size) : super(size);
}

class LayerShow extends LayerState {
  final LayerHeaderCubit headerCubit;

  final LayerBodyCubit bodyCubit;

  const LayerShow(Size size, this.headerCubit, this.bodyCubit) : super(size);
}
