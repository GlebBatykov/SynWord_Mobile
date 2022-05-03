import 'package:synword_flutter_cubit_application/presentation/model/page/history/result/rephrase/rephrased_word.dart';

import '../../result_info.dart';

class RephraseResultInfo extends ResultInfo {
  final String rephrasedText;

  final List<RephrasedWord> rephrasedWord;

  RephraseResultInfo(
      String text, TextSource source, this.rephrasedText, this.rephrasedWord)
      : super(text, source);
}
