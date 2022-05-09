import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/layer/body/layer_body_content_data.dart';

part 'layer_body_state.dart';

typedef ContentBuilder<T> = Widget Function(T);

class LayerBodyCubit<T extends LayerBodyContentData>
    extends Cubit<LayerBodyState> {
  final ContentBuilder<T>? _builder;

  LayerBodyCubit({ContentBuilder<T>? builder})
      : _builder = builder,
        super(LayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {}

  void load() {
    emit(LayerBodyLoad());
  }

  void show(T data) {
    late Widget content;

    if (_builder != null) {
      content = _builder!.call(data);
    } else {
      content = Container();
    }

    emit(LayerBodyShow(content));
  }
}
