import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/layer/text_input_layer/editing_change_details.dart';
import '../../../model/layer/text_input_layer/length_borders.dart';
import '../../../model/layer/text_input_layer/text_change_details.dart';
import 'body/text_input_layer_body_cubit.dart';
import 'header/text_input_layer_header_cubit.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  final Size _size;

  final LengthBorders _textLengthBorders;

  late final TextInputLayerHeaderCubit _headerCubit;

  late final TextInputLayerBodyCubit _bodyCubit;

  Stream<TextChangeDetails> get textChanges => _bodyCubit.textChanges;

  Stream<EditingChangeDetails> get editingChanges => _bodyCubit.editingChanges;

  TextInputLayerCubit(LengthBorders textLengthBorders, Size size)
      : _textLengthBorders = textLengthBorders,
        _size = size,
        super(const TextInputLyaerInitial()) {
    _initialize();
  }

  void _initialize() {
    _headerCubit = TextInputLayerHeaderCubit(_textLengthBorders);
    _bodyCubit = TextInputLayerBodyCubit();

    _bodyCubit.pasteText.listen(_handlePastText);

    emit(TextInputLayerShow(_size, _headerCubit, _bodyCubit));
  }

  void _handlePastText(int length) {
    if (length > 0) {
      toEditing();
      _headerCubit.changeTextLegnth(length);
      _bodyCubit.focus();
    }
  }

  void toEmpty() {
    _headerCubit.toEmpty();
    _bodyCubit.toEmpty();
  }

  void toEditing() {
    _headerCubit.toEditing();
    _bodyCubit.toNotEmpty();
  }

  void toNotEmptyShow() {
    _headerCubit.toNotEmptyShow();
    _bodyCubit.unfocus();
  }

  void toBackground() {
    _headerCubit.toBackground();
    _bodyCubit.toBackground();
  }

  void toForeground() {
    _headerCubit.toForeground();
    _bodyCubit.toForeground();
  }
}
