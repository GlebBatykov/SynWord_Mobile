import 'package:flutter/material.dart';

import '../../../button/rounded/rounded_account_button.dart';
import '../../page_title_bar.dart';
import 'history_page_clock_board.dart';

class HistoryPageTitleBar extends StatelessWidget {
  const HistoryPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      ratio: const [0.2, 0.6, 0.2],
      center: const HistoryPageClockBoard(),
      right: const RoundedAccountButton(),
    );
  }
}
