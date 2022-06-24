import 'package:synword/domain/model/check/check_result_link.dart';

import '../../result_info.dart';

class CheckResultInfo extends ResultInfo {
  final int percentages;

  final List<CheckResultLink> links;

  CheckResultInfo(String text, this.percentages, this.links) : super(text);
}
