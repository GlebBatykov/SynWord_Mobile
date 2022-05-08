import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../../../../model/layer/text_input_layer/editing_change_details.dart';
import '../../../../model/layer/text_input_layer/text_change_details.dart';

part 'text_input_layer_body_state.dart';

class TextInputLayerBodyCubit extends Cubit<TextInputLayerBodyState> {
  final StreamController<TextChangeDetails> _textChangeController =
      StreamController.broadcast();

  final StreamController<int> _pasteTextController =
      StreamController.broadcast();

  final StreamController<EditingChangeDetails> _editingChangeController =
      StreamController.broadcast();

  final TextEditingController _editingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool _isEmpty = false;

  Stream<TextChangeDetails> get textChanges => _textChangeController.stream;

  Stream<int> get pasteText => _pasteTextController.stream;

  Stream<EditingChangeDetails> get editingChanges =>
      _editingChangeController.stream;

  TextInputLayerBodyCubit() : super(TextInputLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _editingController.addListener(() {
      _textChangeController.sink.add(TextChangeDetails(
          _editingController.text.length, _focusNode.hasFocus));
    });

    _focusNode.addListener(() {
      _editingChangeController.sink.add(EditingChangeDetails(
          _editingController.text.length, _focusNode.hasFocus));
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

  void focus() {
    _focusNode.requestFocus();
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

  Future<void> paste() async {
    _editingController.text = await FlutterClipboard.paste();

    _pasteTextController.sink.add(_editingController.text.length);
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
    await _pasteTextController.close();
    await _editingChangeController.close();

    return super.close();
  }
}
