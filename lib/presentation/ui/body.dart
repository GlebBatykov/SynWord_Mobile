import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/body/body_cubit.dart';
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
          BlocBuilder<BodyCubit, BodyState>(
              bloc: GetIt.instance<BodyCubit>(),
              builder: (context, state) {
                if (state is BodyShow) {
                  return Expanded(
                      child: Stack(
                    children: [
                      BlocProvider.value(
                          value: state.inputLayerCubit,
                          child: const TextInputLayer()),
                      BlocProvider.value(
                          value: state.slidersCubit, child: const Sliders())
                    ],
                  ));
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
