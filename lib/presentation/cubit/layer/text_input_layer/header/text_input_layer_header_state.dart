part of 'text_input_layer_header_cubit.dart';

@immutable
abstract class TextInputLayerHeaderState {}

class TextInputLayerHeaderInitial extends TextInputLayerHeaderState {}

class TextInputLayerHeaderShow extends TextInputLayerHeaderState {}

class TextInputLayerHeaderForeground extends TextInputLayerHeaderShow {}

class TextInputLayerHeaderEmpty extends TextInputLayerHeaderForeground {}

class TextInputLayerHeaderNotEmpty extends TextInputLayerHeaderForeground {
  final int textLength;

  TextInputLayerHeaderNotEmpty(this.textLength);
}

class TextInputLayerHeaderBackground extends TextInputLayerHeaderShow {}
