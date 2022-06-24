import '../../model/check/check_result.dart';

abstract class CheckRemoteRepository {
  Future<CheckResult> checkText(String text);
}
