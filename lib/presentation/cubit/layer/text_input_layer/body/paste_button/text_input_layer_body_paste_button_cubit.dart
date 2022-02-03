import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_input_layer_body_paste_button_state.dart';

class TextInputLayerBodyPasteButtonCubit
    extends Cubit<TextInputLayerBodyPasteButtonState> {
  TextInputLayerBodyPasteButtonCubit()
      : super(TextInputLayerBodyPasteButtonVisible());

  void enableVisible() {
    emit(TextInputLayerBodyPasteButtonVisible());
  }

  void disableVisible() {
    emit(TextInputLayerBodyPasteButtonNotVisible());
  }
}
