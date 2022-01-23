import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'layer_header_state.dart';

class LayerHeaderCubit extends Cubit<LayerHeaderState> {
  final List<Widget> _actions;

  final bool _isActionsVisible;

  LayerHeaderCubit(String title,
      {List<Widget>? actions, bool isActionsVisible = true})
      : _actions = actions ?? [],
        _isActionsVisible = isActionsVisible,
        super(LayerHeaderInitial(title)) {
    emit(LayerHeaderForeground(title, _actions, _isActionsVisible));
  }
}
