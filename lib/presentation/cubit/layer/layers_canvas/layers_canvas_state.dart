part of 'layers_canvas_cubit.dart';

@immutable
abstract class LayersCanvasState {}

class LayersCanvasInitial extends LayersCanvasState {}

class LayersCanvasShow extends LayersCanvasState {
  final TextInputLayerCubit inputLayerCubit;

  LayersCanvasShow(this.inputLayerCubit);
}
