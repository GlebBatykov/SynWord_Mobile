import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/sliders_cubit/sliders_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/layer.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/layer_header/layer_header_copy_button.dart';

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
