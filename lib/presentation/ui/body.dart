import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../cubit/body/body_cubit.dart';
import 'appbar/appbar.dart';
import 'layer/layers_canvas.dart';
import 'page/pages_properties.dart';
import 'sliders/sliders.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appbarHeight = 60.0;

    return Container(
      margin: PagesProperties.margin,
      child: LayoutBuilder(builder: ((context, constraints) {
        var bodyHeight = constraints.maxHeight - appbarHeight;

        var bodySize = Size(constraints.maxWidth, bodyHeight);

        return Column(
          children: [
            SizedBox(height: appbarHeight, child: const Appbar()),
            SizedBox(
              height: constraints.maxHeight - appbarHeight,
              child: BlocBuilder<BodyCubit, BodyState>(
                  bloc: BodyCubit(bodySize),
                  builder: (context, state) {
                    if (state is BodyShow) {
                      return Stack(
                        children: [
                          BlocProvider.value(
                              value: state.canvasCubit,
                              child: const LayersCanvas()),
                          BlocProvider.value(
                              value: state.slidersCubit, child: const Sliders())
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        );
      })),
    );
  }
}
