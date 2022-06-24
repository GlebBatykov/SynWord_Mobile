import '../../../../../../domain/model/rephrase/rephrased_word.dart';
import '../../result_info.dart';

class RephraseResultInfo extends ResultInfo {
  final String rephrasedText;

  final List<RephrasedWord> rephrasedWords;

  RephraseResultInfo(String text, this.rephrasedText, this.rephrasedWords)
      : super(text);
}
