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
  final TextInputLayerBodyPasteButtonCubit pasteButtonCubit;

  TextInputLayerBodyForeground(TextEditingController editingController,
      FocusNode focusNode, this.pasteButtonCubit)
      : super(editingController, focusNode);
}

class TextInputLayerBodyEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyEmpty(TextEditingController editingController,
      FocusNode focusNode, TextInputLayerBodyPasteButtonCubit pasteButtonCubit)
      : super(editingController, focusNode, pasteButtonCubit);
}

class TextInputLayerBodyNotEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyNotEmpty(TextEditingController editingController,
      FocusNode focusNode, TextInputLayerBodyPasteButtonCubit pasteButtonCubit)
      : super(editingController, focusNode, pasteButtonCubit);
}

class TextInputLayerBodyBackground extends TextInputLayerBodyShow {
  TextInputLayerBodyBackground(
    TextEditingController editingController,
    FocusNode focusNode,
  ) : super(editingController, focusNode);
}
