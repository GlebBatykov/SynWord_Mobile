import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layer/layer_body/layer_body_cubit.dart';

class LayerBody extends StatelessWidget {
  const LayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayerBodyCubit, LayerBodyState>(
        builder: (context, state) {
      if (state is LayerBodyLoad) {
        return Container();
      } else if (state is LayerBodyShow) {
        if (state.builder != null) {
          return state.builder!(state.data);
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }
}
