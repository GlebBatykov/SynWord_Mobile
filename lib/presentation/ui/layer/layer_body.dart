import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_body/layer_body_cubit.dart';

class LayerBody extends StatelessWidget {
  const LayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayerBodyCubit, LayerBodyState>(
        builder: (context, state) {
      if (state is LayerBodyLoad) {
        return Container();
      } else if (state is LayerBodyShow) {
        return state.content ?? Container();
      } else {
        return Container();
      }
    });
  }
}
