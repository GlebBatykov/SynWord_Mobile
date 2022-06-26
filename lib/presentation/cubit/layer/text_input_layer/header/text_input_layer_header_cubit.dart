import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword/domain/model/enum/rephrase_language.dart';

import '../../../../model/layer/text_input_layer/length_borders.dart';
import '../../../button/language_select/language_select_button_cubit.dart';

part 'text_input_layer_header_state.dart';

class TextInputLayerHeaderCubit extends Cubit<TextInputLayerHeaderState> {
  final LengthBorders _lengthBorders;

  late final LanguageSelectButtonCubit _selectButtonCubit;

  int _textLength = 0;

  bool _isEmpty = true;

  bool _isEditing = false;

  late RephraseLanguage _rephraseLanguage;

  RephraseLanguage get rephraseLanguage => _rephraseLanguage;

  TextInputLayerHeaderCubit(LengthBorders lengthBorders)
      : _lengthBorders = lengthBorders,
        super(TextInputLayerHeaderInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectButtonCubit = LanguageSelectButtonCubit(onSelect: (item) {
      _rephraseLanguage = item.rephraseLanguage;
    });

    _rephraseLanguage = _selectButtonCubit.current.rephraseLanguage;

    toEmpty();
  }

  void changeTextLegnth(int length) {
    if (length != _textLength) {
      _textLength = length;

      if (!_isEmpty) {
        if (_isEditing) {
          emit(TextInputLayerHeaderEditing(_textLength, _lengthBorders));
        } else {
          emit(TextInputLayerHeaderNotEmptyShow(_textLength, _lengthBorders));
        }
      }
    }
  }

  void toEmpty() {
    if (!_isEmpty) {
      emit(TextInputLayerHeaderEmpty());

      _isEmpty = true;
      _isEditing = false;
      _textLength = 0;
    }
  }

  void toEditing() {
    if (!_isEditing) {
      emit(TextInputLayerHeaderEditing(_textLength, _lengthBorders));

      _isEditing = true;
      _isEmpty = false;
    }
  }

  void toNotEmptyShow() {
    if (!_isEmpty) {
      emit(TextInputLayerHeaderNotEmptyShow(_textLength, _lengthBorders));

      _isEditing = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerHeaderBackground());

    _isEditing = false;
  }

  void toForeground() {
    if (_isEmpty) {
      emit(TextInputLayerHeaderEmpty());
    } else {
      emit(TextInputLayerHeaderNotEmptyShow(_textLength, _lengthBorders));
    }

    _isEditing = false;
  }
}
