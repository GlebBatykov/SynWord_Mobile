import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/use_case/clipboard_copy/clipboard_copy_use_case.dart';
import '../../../../../domain/use_case/clipboard_paste/clipboard_paste_use_case.dart';
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

  bool _isBackground = false;

  double _arrowsOpacity = 1;

  Stream<TextChangeDetails> get textChanges => _textChangeController.stream;

  Stream<int> get pasteTextStream => _pasteTextController.stream;

  String get text => _editingController.text;

  bool get isEditing => _focusNode.hasFocus;

  Stream<EditingChangeDetails> get editingChanges =>
      _editingChangeController.stream;

  TextInputLayerBodyCubit() : super(TextInputLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _editingController.addListener(() {
      _textChangeController.sink
          .add(TextChangeDetails(_editingController.text.length, isEditing));
    });

    _focusNode.addListener(() {
      _editingChangeController.sink
          .add(EditingChangeDetails(_editingController.text.length, isEditing));
    });

    toEmpty();
  }

  void toEmpty() {
    if (!_isEmpty) {
      _editingController.clear();

      _focusNode.unfocus();

      _arrowsOpacity = 1;

      _editingChangeController.sink
          .add(EditingChangeDetails(_editingController.text.length, isEditing));

      emit(TextInputLayerBodyEmpty(
          _editingController, _focusNode, _arrowsOpacity));

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
    if (_isEmpty || _isBackground) {
      _arrowsOpacity = 0;

      emit(TextInputLayerBodyNotEmpty(
          _editingController, _focusNode, _arrowsOpacity));

      _isEmpty = false;
      _isBackground = false;
    }
  }

  void toBackground() {
    emit(TextInputLayerBodyBackground(
      _editingController,
      _focusNode,
    ));

    _isBackground = true;
  }

  Future<void> copy() async {
    await GetIt.instance<ClipboardCopyUserCase>().copy(_editingController.text);
  }

  Future<void> paste() async {
    _editingController.text =
        await GetIt.instance<ClipboardPasteUseCase>().paste();

    _pasteTextController.sink.add(_editingController.text.length);
  }

  void toForeground() {
    if (_editingController.text.isEmpty) {
      toEmpty();
    } else {
      toNotEmpty();
    }
  }

  void pasteText(String text) {
    _editingController.text = text;

    _pasteTextController.sink.add(_editingController.text.length);
  }

  @override
  Future<void> close() async {
    await _textChangeController.close();
    await _pasteTextController.close();
    await _editingChangeController.close();

    return super.close();
  }
}
