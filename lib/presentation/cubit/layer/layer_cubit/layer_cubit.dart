import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../layer_body/layer_body_cubit.dart';
import '../layer_header/layer_header_cubit.dart';

part 'layer_state.dart';

class LayerCubit extends Cubit<LayerState> {
  final List<Widget>? _actions;

  late final LayerHeaderCubit _headerCubit;

  late final LayerBodyCubit _bodyCubit;

  Offset _offset;

  Size _size;

  LayerCubit(String title, Offset offset, Size size,
      {Widget? body, List<Widget>? actions})
      : _actions = actions,
        _offset = offset,
        _size = size,
        super(LayerInitial(offset, size)) {
    _headerCubit = LayerHeaderCubit(title, actions: _actions);

    _bodyCubit = LayerBodyCubit(content: body);

    _show();
  }

  void move(Offset offset) {
    _offset += offset;

    _show();
  }

  void _show() {
    emit(LayerShow(_headerCubit, _bodyCubit, _offset, _size));
  }
}
