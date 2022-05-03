part of 'text_input_layer_header_cubit.dart';

@immutable
abstract class TextInputLayerHeaderState {}

class TextInputLayerHeaderInitial extends TextInputLayerHeaderState {}

class TextInputLayerHeaderShow extends TextInputLayerHeaderState {}

class TextInputLayerHeaderForeground extends TextInputLayerHeaderShow {}

class TextInputLayerHeaderEmpty extends TextInputLayerHeaderForeground {}

abstract class TextInputLayerHeaderNotEmpty
    extends TextInputLayerHeaderForeground {
  final int textLength;

  final LengthBorders lengthBorders;

  TextInputLayerHeaderNotEmpty(this.textLength, this.lengthBorders);
}

class TextInputLayerHeaderNotEmptyShow extends TextInputLayerHeaderNotEmpty {
  TextInputLayerHeaderNotEmptyShow(int textLength, LengthBorders lengthBorders)
      : super(textLength, lengthBorders);
}

class TextInputLayerHeaderEditing extends TextInputLayerHeaderNotEmpty {
  TextInputLayerHeaderEditing(int textLength, LengthBorders lengthBorders)
      : super(textLength, lengthBorders);
}

class TextInputLayerHeaderBackground extends TextInputLayerHeaderShow {}
