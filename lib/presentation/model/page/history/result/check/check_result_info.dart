import 'package:synword/presentation/model/page/history/result/check/check_result_link.dart';

import '../../result_info.dart';

class CheckResultInfo extends ResultInfo {
  final int percentages;

  final List<CheckResultLink> links;

  CheckResultInfo(String text, TextSource source, this.percentages, this.links)
      : super(text, source);
}
