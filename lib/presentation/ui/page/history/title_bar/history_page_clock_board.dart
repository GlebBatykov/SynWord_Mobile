import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../asset/history_page_asset.dart';
import '../../page_title_bar_blured_board.dart';

class HistoryPageClockBoard extends StatelessWidget {
  const HistoryPageClockBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBarBluredBoard(
        color: HexColor('#634357'),
        blurOpacity: 0.12,
        gradient:
            LinearGradient(colors: [HexColor('#C0392B'), HexColor('#8E44AD')]),
        child: Center(
            child: Image.asset(HistoryPageAsset.clock, width: 50, height: 50)));
  }
}
