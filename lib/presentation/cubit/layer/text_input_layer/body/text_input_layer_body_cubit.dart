import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

part 'text_input_layer_body_state.dart';

class TextInputLayerBodyCubit extends Cubit<TextInputLayerBodyState> {
  final StreamController<int> _textChangeController =
      StreamController.broadcast();

  final TextEditingController _editingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool _isEmpty = false;

  Stream<int> get textChanges => _textChangeController.stream;

  TextInputLayerBodyCubit() : super(TextInputLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _editingController.addListener(() {
      _textChangeController.sink.add(_editingController.text.length);
    });

    toEmpty();
  }

  void toEmpty() {
    if (!_isEmpty) {
      _editingController.clear();

      _focusNode.unfocus();

      emit(TextInputLayerBodyEmpty(_editingController, _focusNode));

      _isEmpty = true;
    }
  }

  void unfocus() {
    _focusNode.unfocus();
  }

  void toNotEmpty() {
    if (_isEmpty) {
      emit(TextInputLayerBodyNotEmpty(_editingController, _focusNode));

      _isEmpty = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerBodyBackground(
      _editingController,
      _focusNode,
    ));
  }

  Future<void> copy() async {
    await FlutterClipboard.copy(_editingController.text);
  }

  void toForeground() {
    if (_editingController.text.isEmpty) {
      toEmpty();
    } else {
      toNotEmpty();
    }
  }

  @override
  Future<void> close() async {
    await _textChangeController.close();

    return super.close();
  }
}
