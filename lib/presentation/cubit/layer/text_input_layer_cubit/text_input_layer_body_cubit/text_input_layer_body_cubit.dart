import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_input_layer_body_state.dart';

class TextInputLayerBodyCubit extends Cubit<TextInputLayerBodyState> {
  late final TextEditingController _editingController = TextEditingController();

  TextInputLayerBodyCubit() : super(TextInputLayerBodyInitial()) {
    emit(TextInputLayerBodyEmpty(_editingController));
  }
}
