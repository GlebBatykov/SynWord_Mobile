import '../../../../../../domain/model/result/check/check_result_check_result_link.dart';

import '../../result_info.dart';

class CheckResultInfo extends ResultInfo {
  final int percentages;

  final List<CheckResultCheckResultLink> links;

  CheckResultInfo(super.text, this.percentages, this.links);
}
