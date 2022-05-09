part of 'text_input_layer_cubit.dart';

@immutable
class TextInputLayerState {
  const TextInputLayerState();
}

class TextInputLyaerInitial extends TextInputLayerState {
  const TextInputLyaerInitial();
}

class TextInputLayerShow extends TextInputLayerState {
  final Size size;

  final TextInputLayerHeaderCubit headerCubit;

  final TextInputLayerBodyCubit bodyCubit;

  const TextInputLayerShow(this.size, this.headerCubit, this.bodyCubit);
}
