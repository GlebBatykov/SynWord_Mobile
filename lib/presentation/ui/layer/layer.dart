import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layer/layer_cubit/layer_cubit.dart';
import 'layer_body.dart';
import 'layer_header/layer_header.dart';

class Layer extends StatelessWidget {
  const Layer({Key? key}) : super(key: key);

  Widget _buildLayer(LayerState state) {
    if (state is LayerShow) {
      return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(
                height: 55,
                child: BlocProvider.value(
                    value: state.headerCubit, child: const LayerHeader())),
            BlocProvider.value(value: state.bodyCubit, child: const LayerBody())
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
    return BlocBuilder<LayerCubit, LayerState>(builder: (context, state) {
      return Positioned(
          left: state.offset.dx,
          top: state.offset.dy,
          width: MediaQuery.of(context).size.width,
          child: _buildLayer(state));
    });
  }
}
