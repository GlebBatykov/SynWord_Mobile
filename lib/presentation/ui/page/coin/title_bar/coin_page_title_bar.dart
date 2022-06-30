import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/button/account_button/cubit/account_button_cubit.dart';
import '../../../../cubit/page/coin/coin_page_cubit.dart';
import '../../../button/account_button.dart';
import '../../page_title_bar.dart';
import 'coin_page_balance_board.dart';

class CoinPageTitleBar extends StatelessWidget {
  const CoinPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinPageCubit, CoinPageState>(builder: (context, state) {
      if (state is CoinPageShow) {
        return PageTitleBar(
          ratio: const [0.2, 0.6, 0.2],
          center: CoinPageBalanceBoard(balance: state.balance),
          right: BlocProvider<AccountButtonCubit>(
            create: (context) => AccountButtonCubit(),
            child: const AccountButton(),
          ),
        );
      } else if (state is CoinPageLoad) {
        return PageTitleBar(
          ratio: const [0.2, 0.6, 0.2],
          center: const CoinPageBalanceBoard(balance: 0),
          right: BlocProvider<AccountButtonCubit>(
            create: (context) => AccountButtonCubit(),
            child: const AccountButton(),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
