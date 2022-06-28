import 'package:synword/domain/model/history/check/check_history_check_result_link.dart';

import '../result_history.dart';

class CheckHistory extends ResultHistory {
  final String text;

  final int percent;

  final List<CheckHistoryCheckResultLink> matches;

  CheckHistory(super.id, this.text, this.percent, this.matches);
}
