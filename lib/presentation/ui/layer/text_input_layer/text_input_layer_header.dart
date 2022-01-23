import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_header_cubit/text_input_layer_header_cubit.dart';

class TextInputLayerHeader extends StatelessWidget {
  const TextInputLayerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputLayerHeaderCubit, TextInputLayerHeaderState>(
        builder: (context, state) {
      if (state is TextInputLayerHeaderNotEmpty) {
        return Container();
      } else if (state is TextInputLayerHeaderBackground) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}
