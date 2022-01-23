import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'layer_body_state.dart';

class LayerBodyCubit extends Cubit<LayerBodyState> {
  final Widget? _content;

  LayerBodyCubit({Widget? content})
      : _content = content,
        super(LayerBodyInitial());
}
