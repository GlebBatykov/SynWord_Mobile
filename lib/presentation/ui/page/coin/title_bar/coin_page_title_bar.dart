import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/coin_page/coin_page_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/coin/title_bar/coin_page_balance_board.dart';

import '../../page_title_bar.dart';

class CoinPageTitleBar extends StatelessWidget {
  const CoinPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinPageCubit, CoinPageState>(builder: (context, state) {
      if (state is CoinPageShow) {
        return PageTitleBar(
          center: CoinPageBalanceBoard(balance: state.balance),
        );
      } else {
        return Container();
      }
    });
  }
}
