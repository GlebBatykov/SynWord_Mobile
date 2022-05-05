import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/layer/body/layer_body_content_data.dart';
import '../layer_body/layer_body_cubit.dart';
import '../layer_header/layer_header_cubit.dart';

part 'layer_state.dart';

class LayerCubit<T extends LayerBodyContentData> extends Cubit<LayerState> {
  final ContentBuilder<T>? _bodyBuilder;

  final List<Widget>? _actions;

  late final LayerHeaderCubit _headerCubit;

  late final LayerBodyCubit _bodyCubit;

  Offset _offset;

  Size _size;

  LayerCubit(String title, Color headerColor, Offset offset, Size size,
      {ContentBuilder<T>? bodyBuilder, List<Widget>? actions})
      : _actions = actions,
        _bodyBuilder = bodyBuilder,
        _offset = offset,
        _size = size,
        super(LayerInitial(offset, size)) {
    _initialize(title, headerColor);
  }

  void _initialize(String title, Color headerColor) {
    _headerCubit = LayerHeaderCubit(title, headerColor, actions: _actions);

    _bodyCubit = LayerBodyCubit<T>(builder: _bodyBuilder);

    load();

    show();
  }

  void move(Offset offset) {
    _offset += offset;

    show();
  }

  void load() {
    _bodyCubit.load();
  }

  void show() {
    emit(LayerShow(_headerCubit, _bodyCubit, _offset, _size));
  }
}
