import 'result_info.dart';

class CheckResultInfo extends ResultInfo {
  final int percentages;

  CheckResultInfo(String text, TextSource source, this.percentages)
      : super(text, source);
}
