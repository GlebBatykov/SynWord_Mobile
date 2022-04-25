import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poseidon/poseidon.dart';

import '../cubit/page/coin/coin_page_cubit.dart';
import '../cubit/page/history/history_page_cubit.dart';
import '../cubit/page/history/result/check/check_result_page_cubit.dart';
import '../cubit/page/history/result/rephrase/rephrase_result_page_cubit.dart';
import '../cubit/page/premium/premium_page_cubit.dart';
import '../ui/page/coin/coin_page.dart';
import '../ui/page/history/history_page.dart';
import '../ui/page/history/result/check/check_result_page.dart';
import '../ui/page/history/result/rephrase/rephrase_result_page.dart';
import '../ui/page/premium/premium_page.dart';
import 'check_result_page_arguments.dart';
import 'navigation_routes.dart';
import 'rephrase_result_page_arguments.dart';

class NavigationBuilder {
  void build() {
    Poseidon.createRoutes(routes: [
      PoseidonRoute(
          path: NavigationRoutes.premiumPage,
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => PremiumPageCubit(),
                    child: const PremiumPage()));
          }),
      PoseidonRoute(
          path: NavigationRoutes.coinPage,
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => CoinPageCubit(),
                    child: const CoinPage()));
          }),
      PoseidonRoute(
          path: NavigationRoutes.historyPage,
          builder: (context, argument) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => HistoryPageCubit(),
                    child: const HistoryPage()));
          }),
      PoseidonRoute<CheckResultPageArguments>(
          path: NavigationRoutes.checkResultPage,
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) => CheckResultPageCubit(arguments.info),
                    child: const CheckResultPage()));
          }),
      PoseidonRoute<RephraseResultPageArguments>(
          path: NavigationRoutes.rephraseResultPage,
          builder: (context, arguments) {
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) =>
                        RephraseResultPageCubit(arguments.info),
                    child: const RephraseResultPage()));
          })
    ]);
  }
}
