import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'body/text_input_layer_body_cubit.dart';
import 'header/text_input_layer_header_cubit.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  late final TextInputLayerHeaderCubit _headerCubit;

  late final TextInputLayerBodyCubit _bodyCubit;

  TextInputLayerCubit() : super(const TextInputLyaerInitial()) {
    _initialize();
  }

  void _initialize() {
    _headerCubit = TextInputLayerHeaderCubit();
    _bodyCubit = TextInputLayerBodyCubit();

    emit(TextInputLayerShow(_headerCubit, _bodyCubit));
  }

  void toEmpty() {
    _headerCubit.toEmpty();
    _bodyCubit.toEmpty();
  }

  void toNotEmpty() {
    _headerCubit.toNotEmpty();
    _bodyCubit.toNotEmpty();
  }

  void toBackground() {
    _headerCubit.toBackground();
    _bodyCubit.toBackground();
  }

  void toForeground() {
    _headerCubit.toForeground();
    _bodyCubit.toForeground();
  }

  void changeTextLegnth(int length) {
    _headerCubit.changeTextLegnth(length);
  }
}
