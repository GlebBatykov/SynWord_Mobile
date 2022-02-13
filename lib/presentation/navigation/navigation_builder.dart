import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/premium_page/premium_page_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/premium_page.dart';

class NavigationBuilder extends PoseidonBuilder {
  @override
  Poseidon build() {
    var poseidon = Poseidon();

    poseidon.createRoutes(routes: [
      PoseidonRoute(
          path: '/premium',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => PremiumPageCubit(),
                    child: const PremiumPage()));
          })
    ]);

    return poseidon;
  }
}
