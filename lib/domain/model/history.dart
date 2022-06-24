import 'check/check_result.dart';
import 'rephrase/rephrase_result.dart';

class History {
  final List<RephraseResult> rephraseHistories;

  final List<CheckResult> checkHistories;

  History(this.rephraseHistories, this.checkHistories);
}
