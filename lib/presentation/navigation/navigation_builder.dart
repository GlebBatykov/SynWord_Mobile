import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/coin_page/coin_page_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/premium_page/premium_page_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/coin/coin_page.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/premium_page.dart';

class NavigationBuilder {
  void build() {
    Poseidon.createRoutes(routes: [
      PoseidonRoute(
          path: '/premium',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => PremiumPageCubit(),
                    child: const PremiumPage()));
          }),
      PoseidonRoute(
          path: '/coin',
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => CoinPageCubit(),
                    child: const CoinPage()));
          })
    ]);
  }
}
