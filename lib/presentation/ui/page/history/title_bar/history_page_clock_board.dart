import 'package:flutter/material.dart';

import '../../../../asset/history_page_asset.dart';
import '../../page_title_bar_blured_board.dart';

class HistoryPageClockBoard extends StatelessWidget {
  const HistoryPageClockBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBarBluredBoard(
        child: Center(
            child: Image.asset(HistoryPageAsset.clock, width: 50, height: 50)));
  }
}
