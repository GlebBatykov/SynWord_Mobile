import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders/sliders_cubit/sliders_cubit.dart';
import 'appbar/appbar.dart';
import 'sliders/sliders.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbar(),
        Expanded(
            child: Stack(
          children: [
            BlocProvider<SlidersCubit>(
                create: (context) => SlidersCubit(), child: const Sliders())
          ],
        ))
      ],
    );
  }
}
