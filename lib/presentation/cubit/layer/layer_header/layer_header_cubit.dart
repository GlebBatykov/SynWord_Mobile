import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'layer_header_state.dart';

class LayerHeaderCubit extends Cubit<LayerHeaderState> {
  final String _title;

  final Color _color;

  final List<Widget> _actions;

  final bool _isActionsVisible;

  final void Function()? onClose;

  LayerHeaderCubit(String title, Color color,
      {List<Widget>? actions, bool isActionsVisible = true, this.onClose})
      : _title = title,
        _color = color,
        _actions = actions ?? [],
        _isActionsVisible = isActionsVisible,
        super(LayerHeaderInitial(title)) {
    _initialize();
  }

  void _initialize() {
    emit(LayerHeaderForeground(_title, _actions, _isActionsVisible));
  }

  void toForeground() {
    emit(LayerHeaderForeground(_title, _actions, _isActionsVisible));
  }

  void toBackground() {
    emit(LayerHeaderBackground(_title, _color));
  }
}
