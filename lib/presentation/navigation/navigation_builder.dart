import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../cubit/page/coin/coin_page_cubit.dart';
import '../cubit/page/history/history_page_cubit.dart';
import '../cubit/page/premium/premium_page_cubit.dart';
import '../ui/page/coin/coin_page.dart';
import '../ui/page/history/history_page.dart';
import '../ui/page/premium/premium_page.dart';

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
          }),
      PoseidonRoute(
          path: '/history',
          builder: (context, argument) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => HistoryPageCubit(),
                    child: const HistoryPage()));
          })
    ]);
  }
}
