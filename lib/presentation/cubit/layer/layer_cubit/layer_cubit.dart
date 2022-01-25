import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_body/layer_body_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_header/layer_header_cubit.dart';

part 'layer_state.dart';

class LayerCubit extends Cubit<LayerState> {
  final Size _size;

  final List<Widget>? _actions;

  late final LayerHeaderCubit _headerCubit;

  late final LayerBodyCubit _bodyCubit;

  LayerCubit(String title, Size size, {Widget? body, List<Widget>? actions})
      : _size = size,
        _actions = actions,
        super(LayerInitial(size)) {
    _headerCubit = LayerHeaderCubit(title, actions: _actions);

    _bodyCubit = LayerBodyCubit(content: body);

    emit(LayerShow(_size, _headerCubit, _bodyCubit));
  }
}
