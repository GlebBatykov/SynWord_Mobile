import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'layers_canvas_state.dart';

class LayersCanvasCubit extends Cubit<LayersCanvasState> {
  LayersCanvasCubit() : super(LayersCanvasInitial());
}
