import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_cubit/layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/layer_body.dart';

import 'layer_header/layer_header.dart';

class Layer extends StatelessWidget {
  const Layer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayerCubit, LayerState>(builder: (context, state) {
      if (state is LayerShow) {
        return Container(
          width: state.size.width,
          height: state.size.height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              SizedBox(
                  height: 55,
                  child: BlocProvider.value(
                      value: state.headerCubit, child: const LayerHeader())),
              BlocProvider.value(
                  value: state.bodyCubit, child: const LayerBody())
            ],
          ),
        );
      } else {
        return Container(
            width: state.size.width,
            height: state.size.height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)));
      }
    });
  }
}
