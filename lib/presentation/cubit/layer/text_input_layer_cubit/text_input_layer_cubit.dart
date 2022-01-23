import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  final Size _size;

  late final TextEditingController _editingController;

  TextInputLayerCubit(Size size)
      : _size = size,
        super(TextInputLyaerInitial(size)) {
    _editingController = TextEditingController();

    emit(TextInputLayerEmpty(_size, _editingController));
  }
}
