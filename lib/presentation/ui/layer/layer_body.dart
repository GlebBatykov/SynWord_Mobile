import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layer/layer_body/layer_body_cubit.dart';
import '../load_screen.dart';

class LayerBody extends StatelessWidget {
  const LayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayerBodyCubit, LayerBodyState>(
        builder: (context, state) {
      if (state is LayerBodyLoad) {
        return const LoadScreen(
          subtitle: 'The average waiting time is 15 seconds',
        );
      } else if (state is LayerBodyShow) {
        return state.content;
      } else {
        return Container();
      }
    });
  }
}
