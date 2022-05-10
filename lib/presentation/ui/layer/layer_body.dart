import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layer/operation_layer/operation_layer.dart';
import '../load_screen.dart';

class LayerBody extends StatelessWidget {
  const LayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationLayerBodyCubit, OperationLayerBodyState>(
        builder: (context, state) {
      if (state is OperationLayerBodyLoad) {
        return const LoadScreen(
          subtitle: 'The average waiting time is 15 seconds',
        );
      } else if (state is OperationLayerBodyShow) {
        return state.content;
      } else {
        return Container();
      }
    });
  }
}
