import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/button/account_button/cubit/account_button_cubit.dart';
import '../../../button/account_button.dart';
import '../../page_clock_board.dart';
import '../../page_title_bar.dart';

class HistoryPageTitleBar extends StatelessWidget {
  const HistoryPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      ratio: const [0.2, 0.6, 0.2],
      center: const PageClockBoard(),
      right: BlocProvider<AccountButtonCubit>(
        create: (context) => AccountButtonCubit(),
        child: const AccountButton(),
      ),
    );
  }
}
