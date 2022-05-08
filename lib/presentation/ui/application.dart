import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poseidon/poseidon.dart';

import '../cubit/application/application_cubit.dart';
import '../cubit/page/update_screen/update_screen_cubit.dart';
import 'home.dart';
import 'page/splash_screen.dart';
import 'page/update_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SynWord',
      scaffoldMessengerKey: Poseidon.instance.scaffoldMessengerKey,
      navigatorKey: Poseidon.instance.navigationKey,
      home: BlocBuilder<ApplicationCubit, ApplicationState>(
          bloc: GetIt.instance<ApplicationCubit>(),
          builder: (context, state) {
            if (state is ApplicationLoad) {
              return const SplashScreen();
            } else if (state is ApplicationUpdate) {
              return BlocProvider<UpdateScreenCubit>.value(
                  value: state.updateScreenCubit, child: const UpdateScreen());
            } else if (state is ApplicationWork) {
              return const Home();
            } else {
              return Container();
            }
          }),
    );
  }
}
