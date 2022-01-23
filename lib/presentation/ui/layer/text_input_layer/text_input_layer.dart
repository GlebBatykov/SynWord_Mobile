import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_body_cubit/text_input_layer_body_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_header_cubit/text_input_layer_header_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/text_input_layer/text_input_layer_body.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/text_input_layer/text_input_layer_header.dart';

class TextInputLayer extends StatelessWidget {
  const TextInputLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputLayerCubit, TextInputLayerState>(
        builder: (context, state) {
      if (state is TextInputLayerShow) {
        return Container(
          width: state.size.width,
          height: state.size.height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              BlocProvider<TextInputLayerHeaderCubit>.value(
                  value: state.headerCubit,
                  child: const TextInputLayerHeader()),
              BlocProvider<TextInputLayerBodyCubit>.value(
                  value: state.bodyCubit, child: const TextInputLayerBody())
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
