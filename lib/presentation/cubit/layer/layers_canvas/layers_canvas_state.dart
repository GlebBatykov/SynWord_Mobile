part of 'layers_canvas_cubit.dart';

@immutable
abstract class LayersCanvasState {}

class LayersCanvasInitial extends LayersCanvasState {}

class LayersCanvasShow extends LayersCanvasState {
  final Size size;

  final TextInputLayerCubit inputLayerCubit;

  final List<LayerCubit> layersCubits;

  LayersCanvasShow(this.size, this.inputLayerCubit, this.layersCubits);
}
