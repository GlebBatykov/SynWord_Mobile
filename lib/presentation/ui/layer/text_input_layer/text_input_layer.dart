import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import 'body/text_input_layer_body.dart';
import 'text_input_layer_header.dart';

class TextInputLayer extends StatelessWidget {
  const TextInputLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputLayerCubit, TextInputLayerState>(
        builder: (context, state) {
      if (state is TextInputLayerShow) {
        return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: state.headerCubit),
              BlocProvider.value(value: state.bodyCubit)
            ],
            child: Column(
              children: const [
                TextInputLayerHeader(),
                Expanded(child: TextInputLayerBody())
              ],
            ),
          ),
        );
      } else {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)));
      }
    });
  }
}
