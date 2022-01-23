part of 'text_input_layer_cubit.dart';

@immutable
class TextInputLayerState {
  final Size size;

  const TextInputLayerState(this.size);
}

class TextInputLyaerInitial extends TextInputLayerState {
  const TextInputLyaerInitial(Size size) : super(size);
}

class TextInputLayerShow extends TextInputLayerState {
  final TextInputLayerHeaderCubit headerCubit;

  final TextInputLayerBodyCubit bodyCubit;

  const TextInputLayerShow(Size size, this.headerCubit, this.bodyCubit)
      : super(size);
}
