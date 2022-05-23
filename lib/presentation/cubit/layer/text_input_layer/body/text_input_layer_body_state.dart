part of 'text_input_layer_body_cubit.dart';

@immutable
abstract class TextInputLayerBodyState {}

class TextInputLayerBodyInitial extends TextInputLayerBodyState {}

class TextInputLayerBodyShow extends TextInputLayerBodyState {
  final TextEditingController editingController;

  final FocusNode focusNode;

  TextInputLayerBodyShow(this.editingController, this.focusNode);
}

abstract class TextInputLayerBodyForeground extends TextInputLayerBodyShow {
  final double arrowsOpacity;

  TextInputLayerBodyForeground(
      super.editingController, super.focusNode, this.arrowsOpacity);
}

class TextInputLayerBodyEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyEmpty(
      super.editingController, super.focusNode, super.arrowsOpacity);
}

class TextInputLayerBodyNotEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyNotEmpty(
      super.editingController, super.focusNode, super.arrowsOpacity);
}

class TextInputLayerBodyBackground extends TextInputLayerBodyShow {
  TextInputLayerBodyBackground(super.editingController, super.focusNode);
}
