import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_input_layer_header_state.dart';

class TextInputLayerHeaderCubit extends Cubit<TextInputLayerHeaderState> {
  TextInputLayerHeaderCubit() : super(TextInputLayerHeaderInitial());
}
