import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/layer/text_input_layer/editing_change_details.dart';
import '../../../model/layer/text_input_layer/text_change_details.dart';
import '../layer/layer_cubit.dart';
import '../operation_layer/check/check_layer_cubit.dart';
import '../operation_layer/check/second_check_layer_cubit.dart';
import '../operation_layer/rephrase/rephrase_layer_cubit.dart';
import '../text_input_layer/text_input_layer_cubit.dart';

part 'layers_canvas_state.dart';

class LayersCanvasCubit extends Cubit<LayersCanvasState> {
  final Size _size;

  late final TextInputLayerCubit _inputLayerCubit;

  final List<LayerCubit> _layersCubits = [];

  Stream<TextChangeDetails> get textChanges => _inputLayerCubit.textChanges;

  Stream<EditingChangeDetails> get editingChanges =>
      _inputLayerCubit.editingChanges;

  LayersCanvasCubit(Size size, TextInputLayerCubit inputLayerCubit)
      : _size = size,
        _inputLayerCubit = inputLayerCubit,
        super(LayersCanvasInitial()) {
    _initialize();
  }

  void _initialize() {
    //addCheckLayer();

    addSecondCheckLayer();

    _show();
  }

  void addCheckLayer() {
    var cubit = CheckLayerCubit(const Offset(0, 0), _size);

    cubit.work();

    _layersCubits.add(cubit);
  }

  void addSecondCheckLayer() {
    var cubit = SecondCheckLayerCubit(const Offset(0, 0), _size);

    cubit.work();

    _layersCubits.add(cubit);
  }

  void addRephraseLayer() {
    var cubit = RephraseLayerCubit(const Offset(0, 0), _size);

    cubit.work();

    _layersCubits.add(cubit);
  }

  void removeLayer(LayerCubit cubit) {
    _layersCubits.remove(cubit);

    _show();
  }

  void _show() {
    emit(LayersCanvasShow(_size, _inputLayerCubit, _layersCubits));
  }
}
