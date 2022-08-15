import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/body/body_cubit.dart';
import '../appbar/appbar.dart';
import '../layer/layers_canvas.dart';
import '../page/pages_properties.dart';
import '../sliders/sliders.dart';
import 'body_properties.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<bool> _delayFuture() =>
      Future.delayed(const Duration(milliseconds: 10), () {
        return true;
      });

  BodyCubit _getBodyCubit(Size size) {
    late BodyCubit bodyCubit;

    var isRegistered = GetIt.instance.isRegistered<BodyCubit>();

    if (!isRegistered) {
      bodyCubit = BodyCubit(size);

      GetIt.instance.registerSingleton<BodyCubit>(bodyCubit);
    } else {
      bodyCubit = GetIt.instance<BodyCubit>();
    }

    return bodyCubit;
  }

  @override
  Widget build(BuildContext context) {
    var appbarHeight = BodyProperties.appbarHeight;

    return Container(
      margin: PagesProperties.margin,
      child: FutureBuilder<bool?>(
          future: _delayFuture(),
          builder: ((context, snapshot) {
            if (snapshot.data == true) {
              return LayoutBuilder(builder: ((context, constraints) {
                var bodyHeight = constraints.maxHeight - appbarHeight;

                var bodySize = Size(constraints.maxWidth, bodyHeight);

                var bodyCubit = _getBodyCubit(bodySize);

                return Column(
                  children: [
                    SizedBox(height: appbarHeight, child: const Appbar()),
                    SizedBox(
                      height: constraints.maxHeight - appbarHeight,
                      child: BlocBuilder<BodyCubit, BodyState>(
                          bloc: bodyCubit,
                          builder: (context, state) {
                            if (state is BodyShow) {
                              return Stack(
                                children: [
                                  BlocProvider.value(
                                      value: state.canvasCubit,
                                      child: const LayersCanvas()),
                                  BlocProvider.value(
                                      value: state.slidersCubit,
                                      child: const Sliders())
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    )
                  ],
                );
              }));
            } else {
              return Container();
            }
          })),
    );
  }
}
