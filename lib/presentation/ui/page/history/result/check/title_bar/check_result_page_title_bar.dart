import 'package:flutter/material.dart';
import 'package:synword/presentation/ui/page/history/result/check/title_bar/check_result_page_percentages_board.dart';
import 'package:synword/presentation/ui/page/page_title_bar.dart';

class CheckResultPageTitleBar extends StatelessWidget {
  final int percentages;

  const CheckResultPageTitleBar({Key? key, required this.percentages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      ratio: const [0.2, 0.6, 0.2],
      center: CheckResultPagePercentagesBoard(percentages: percentages),
    );
  }
}
