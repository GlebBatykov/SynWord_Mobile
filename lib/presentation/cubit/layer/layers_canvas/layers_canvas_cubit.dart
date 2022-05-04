import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../text_input_layer/text_input_layer_cubit.dart';

part 'layers_canvas_state.dart';

class LayersCanvasCubit extends Cubit<LayersCanvasState> {
  late final TextInputLayerCubit _inputLayerCubit;

  Stream<int> get textChanges => _inputLayerCubit.textChanges;

  LayersCanvasCubit(TextInputLayerCubit inputLayerCubit)
      : _inputLayerCubit = inputLayerCubit,
        super(LayersCanvasInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(LayersCanvasShow(_inputLayerCubit));
  }
}
