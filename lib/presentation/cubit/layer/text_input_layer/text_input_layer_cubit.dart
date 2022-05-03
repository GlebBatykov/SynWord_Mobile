import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/layer/text_input_layer/length_borders.dart';
import 'body/text_input_layer_body_cubit.dart';
import 'header/text_input_layer_header_cubit.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  final LengthBorders _textLengthBorders;

  late final TextInputLayerHeaderCubit _headerCubit;

  late final TextInputLayerBodyCubit _bodyCubit;

  Stream<int> get textChanges => _bodyCubit.textChanges;

  TextInputLayerCubit(LengthBorders textLengthBorders)
      : _textLengthBorders = textLengthBorders,
        super(const TextInputLyaerInitial()) {
    _initialize();
  }

  void _initialize() {
    _headerCubit = TextInputLayerHeaderCubit(_textLengthBorders);
    _bodyCubit = TextInputLayerBodyCubit();

    emit(TextInputLayerShow(_headerCubit, _bodyCubit));
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
