part of 'text_input_layer_body_cubit.dart';

@immutable
abstract class TextInputLayerBodyState {}

class TextInputLayerBodyInitial extends TextInputLayerBodyState {}

class TextInputLayerBodyShow extends TextInputLayerBodyState {
  final TextEditingController editingController;

  TextInputLayerBodyShow(this.editingController);
}

class TextInputLayerBodyForeground extends TextInputLayerBodyShow {
  final TextInputLayerBodyPasteButtonCubit pasteButtonCubit;

  TextInputLayerBodyForeground(
      TextEditingController editingController, this.pasteButtonCubit)
      : super(editingController);
}

class TextInputLayerBodyEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyEmpty(TextEditingController editingController,
      TextInputLayerBodyPasteButtonCubit pasteButtonCubit)
      : super(editingController, pasteButtonCubit);
}

class TextInputLayerBodyNotEmpty extends TextInputLayerBodyForeground {
  TextInputLayerBodyNotEmpty(TextEditingController editingController,
      TextInputLayerBodyPasteButtonCubit pasteButtonCubit)
      : super(editingController, pasteButtonCubit);
}

class TextInputLayerBodyBackground extends TextInputLayerBodyShow {
  TextInputLayerBodyBackground(TextEditingController editingController)
      : super(editingController);
}
