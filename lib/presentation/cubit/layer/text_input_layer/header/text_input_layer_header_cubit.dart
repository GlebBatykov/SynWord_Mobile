import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_input_layer_header_state.dart';

class TextInputLayerHeaderCubit extends Cubit<TextInputLayerHeaderState> {
  int _textLength = 0;

  bool _isEmpty = true;

  TextInputLayerHeaderCubit() : super(TextInputLayerHeaderInitial()) {
    toEmpty();
  }

  void changeTextLegnth(int length) {
    _textLength = length;

    if (!_isEmpty) {
      emit(TextInputLayerHeaderNotEmpty(_textLength));
    }
  }

  void toEmpty() {
    if (!_isEmpty) {
      emit(TextInputLayerHeaderEmpty());

      _isEmpty = true;
    }
  }

  void toNotEmpty() {
    if (_isEmpty) {
      emit(TextInputLayerHeaderNotEmpty(_textLength));

      _isEmpty = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerHeaderBackground());
  }

  void toForeground() {
    if (_isEmpty) {
      emit(TextInputLayerHeaderEmpty());
    } else {
      emit(TextInputLayerHeaderNotEmpty(_textLength));
    }
  }
}
