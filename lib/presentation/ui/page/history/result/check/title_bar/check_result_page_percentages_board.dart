import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../page_title_bar_blured_board.dart';

class CheckResultPagePercentagesBoard extends StatelessWidget {
  final int percentages;

  const CheckResultPagePercentagesBoard({Key? key, required this.percentages})
      : super(key: key);

  Color _buildPercentagesColor(int percentages) {
    return percentages >= 70
        ? HexColor('#26D222')
        : percentages >= 40
            ? HexColor('#FBFF42')
            : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return PageTitleBarBluredBoard(
      color: HexColor('#634357'),
      gradient: LinearGradient(colors: [
        HexColor('#3F72D7'),
        Colors.black.withOpacity(0.75),
        HexColor('#3F72D7')
      ], stops: const [
        0,
        0.5,
        1
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      width: 136,
      child: Center(
        child: Text(percentages.toString() + '%',
            style: TextStyle(
                color: _buildPercentagesColor(percentages),
                fontSize: 25,
                fontFamily: 'Isidora Soft Alt',
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
