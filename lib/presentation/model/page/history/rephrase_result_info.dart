import 'result_info.dart';

class RephraseResultInfo extends ResultInfo {
  final String rephrasedText;

  RephraseResultInfo(String text, TextSource source, this.rephrasedText)
      : super(text, source);
}
