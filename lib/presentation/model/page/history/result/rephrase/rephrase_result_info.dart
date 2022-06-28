import '../../../../../../domain/model/result/rephrase/rephrase_result_rephrased_word.dart';
import '../../result_info.dart';

class RephraseResultInfo extends ResultInfo {
  final String rephrasedText;

  final List<RephraseResultRephrasedWord> rephrasedWords;

  RephraseResultInfo(String text, this.rephrasedText, this.rephrasedWords)
      : super(text);
}
