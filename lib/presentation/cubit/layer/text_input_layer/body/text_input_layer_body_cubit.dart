import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/body/paste_button/text_input_layer_body_paste_button_cubit.dart';

part 'text_input_layer_body_state.dart';

class TextInputLayerBodyCubit extends Cubit<TextInputLayerBodyState> {
  late final TextInputLayerBodyPasteButtonCubit _pasteButtonCubit;

  late final TextEditingController _editingController = TextEditingController();

  bool _isEmpty = false;

  TextInputLayerBodyCubit() : super(TextInputLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _pasteButtonCubit = TextInputLayerBodyPasteButtonCubit();

    toEmpty();
  }

  void toEmpty() {
    if (!_isEmpty) {
      emit(TextInputLayerBodyEmpty(_editingController, _pasteButtonCubit));

      _pasteButtonCubit.enableVisible();

      _isEmpty = true;
    }
  }

  void toNotEmpty() {
    if (_isEmpty) {
      emit(TextInputLayerBodyNotEmpty(_editingController, _pasteButtonCubit));

      _pasteButtonCubit.disableVisible();

      _isEmpty = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerBodyBackground(_editingController));
  }

  void toForeground() {
    if (_editingController.text.isEmpty) {
      toEmpty();
    } else {
      toNotEmpty();
    }
  }
}
