import 'api_setting.dart';

class ApiDebugSetting extends ApiSetting {
  @override
  String get prefix => 'http';

  @override
  String get host => '10.0.2.2';

  @override
  int get port => 5000;
}
