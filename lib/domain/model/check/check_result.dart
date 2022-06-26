import 'check_result_link.dart';

class CheckResult {
  final String text;

  final double percentages;

  final List<CheckResultLink> links;

  CheckResult(this.text, this.percentages, this.links);
}
