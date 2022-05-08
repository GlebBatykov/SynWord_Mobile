import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'layer_header_state.dart';

class LayerHeaderCubit extends Cubit<LayerHeaderState> {
  final String _title;

  final Color _color;

  final List<Widget> _actions;

  final bool _isActionsVisible;

  final void Function()? _onClose;

  LayerHeaderCubit(String title, Color color,
      {List<Widget>? actions,
      bool isActionsVisible = true,
      void Function()? onClose})
      : _title = title,
        _color = color,
        _actions = actions ?? [],
        _isActionsVisible = isActionsVisible,
        _onClose = onClose,
        super(LayerHeaderInitial(title)) {
    _initialize();
  }

  void _initialize() {
    emit(LayerHeaderForeground(_title, _actions, _isActionsVisible, _onClose));
  }

  void toForeground() {
    emit(LayerHeaderForeground(_title, _actions, _isActionsVisible, _onClose));
  }

  void toBackground() {
    emit(LayerHeaderBackground(_title, _color));
  }
}
