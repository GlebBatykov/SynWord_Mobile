import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import '../cubit/sliders/sliders_cubit/sliders_cubit.dart';
import 'appbar/appbar.dart';
import 'layer/text_input_layer/text_input_layer.dart';
import 'page/pages_properties.dart';
import 'sliders/sliders.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PagesProperties.margin,
      child: Column(
        children: [
          const Appbar(),
          Expanded(
              child: Stack(
            children: [
              BlocProvider(
                  create: (context) => TextInputLayerCubit(),
                  child: const TextInputLayer()),
              BlocProvider(
                  create: (context) => SlidersCubit(), child: const Sliders())
            ],
          ))
        ],
      ),
    );
  }
}
