import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'paste_button/text_input_layer_body_paste_button_cubit.dart';

part 'text_input_layer_body_state.dart';

class TextInputLayerBodyCubit extends Cubit<TextInputLayerBodyState> {
  late final TextInputLayerBodyPasteButtonCubit _pasteButtonCubit;

  final TextEditingController _editingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

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
      _editingController.clear();

      _focusNode.unfocus();

      emit(TextInputLayerBodyEmpty(
          _editingController, _focusNode, _pasteButtonCubit));

      _pasteButtonCubit.enableVisible();

      _isEmpty = true;
    }
  }

  void toNotEmpty() {
    if (_isEmpty) {
      emit(TextInputLayerBodyNotEmpty(
          _editingController, _focusNode, _pasteButtonCubit));

      _pasteButtonCubit.disableVisible();

      _isEmpty = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerBodyBackground(
      _editingController,
      _focusNode,
    ));
  }

  void toForeground() {
    if (_editingController.text.isEmpty) {
      toEmpty();
    } else {
      toNotEmpty();
    }
  }
}
