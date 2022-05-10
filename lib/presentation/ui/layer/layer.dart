import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layer/operation_layer/operation_layer.dart';
import 'layer_body.dart';
import 'layer_header/layer_header.dart';
import 'layer_properties.dart';

class Layer extends StatelessWidget {
  const Layer({Key? key}) : super(key: key);

  Widget _buildLayer(OperationLayerState state) {
    if (state is OperationLayerShow) {
      return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(
                height: LayerProperties.headerHeight,
                child: BlocProvider.value(
                    value: state.headerCubit, child: const LayerHeader())),
            Expanded(
                child: BlocProvider.value(
                    value: state.bodyCubit, child: const LayerBody()))
          ],
        ),
      );
    } else {
      return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationLayerCubit, OperationLayerState>(
        builder: (context, state) {
      return AnimatedPositioned(
          left: state.offset.dx,
          top: state.offset.dy,
          width: state.size.width,
          height: state.size.height,
          duration: const Duration(),
          child: _buildLayer(state));
    });
  }
}
