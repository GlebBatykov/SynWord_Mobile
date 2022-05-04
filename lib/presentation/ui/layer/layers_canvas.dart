import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_cubit/layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/layer.dart';

import '../../cubit/layer/layers_canvas/layers_canvas_cubit.dart';
import 'text_input_layer/text_input_layer.dart';

class LayersCanvas extends StatelessWidget {
  const LayersCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayersCanvasCubit, LayersCanvasState>(
        builder: (context, state) {
      if (state is LayersCanvasShow) {
        return Stack(
          children: [
            BlocProvider.value(
                value: state.inputLayerCubit, child: const TextInputLayer()),
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
