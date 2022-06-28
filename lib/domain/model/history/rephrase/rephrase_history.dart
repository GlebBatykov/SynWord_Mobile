import '../result_history.dart';
import 'rephrase_history_rephrased_word.dart';

class RephraseHistory extends ResultHistory {
  final String sourceText;

  final String rephrasedText;

  final List<RephraseHistoryRephrasedWord> synonyms;

  RephraseHistory(super.id, this.sourceText, this.rephrasedText, this.synonyms);
}
