import 'check/check_history.dart';
import 'rephrase/rephrase_history.dart';
import 'result_history.dart';

class History {
  final List<RephraseHistory> rephraseHistories;

  final List<CheckHistory> checkHistories;

  List<ResultHistory> get resultsHistories => [
        ...rephraseHistories,
        ...checkHistories
      ]..sort((a, b) => a.id.compareTo(b.id));

  History(this.rephraseHistories, this.checkHistories);
}
