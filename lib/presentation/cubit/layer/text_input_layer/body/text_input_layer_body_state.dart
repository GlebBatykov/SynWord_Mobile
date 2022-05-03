part of 'text_input_layer_body_cubit.dart';

@immutable
abstract class TextInputLayerBodyState {}

class TextInputLayerBodyInitial extends TextInputLayerBodyState {}

class TextInputLayerBodyShow extends TextInputLayerBodyState {
  final TextEditingController editingController;

  final FocusNode focusNode;

  TextInputLayerBodyShow(this.editingController, this.focusNode);
}

class TextInputLayerBodyForeground extends TextInputLayerBodyShow {
  TextInputLayerBodyForeground(
      TextEditingController editingController, FocusNode focusNode)
      : super(editingController, focusNode);
}

class TextInputLayerBodyEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyEmpty(
      TextEditingController editingController, FocusNode focusNode)
      : super(editingController, focusNode);
}

class TextInputLayerBodyNotEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyNotEmpty(
      TextEditingController editingController, FocusNode focusNode)
      : super(editingController, focusNode);
}

class TextInpuLayerBodyNotEmptyShow extends TextInputLayerBodyForeground {
  TextInpuLayerBodyNotEmptyShow(
      TextEditingController editingController, FocusNode focusNode)
      : super(editingController, focusNode);
}

class TextInputLayerBodyBackground extends TextInputLayerBodyShow {
  TextInputLayerBodyBackground(
    TextEditingController editingController,
    FocusNode focusNode,
  ) : super(editingController, focusNode);
}
