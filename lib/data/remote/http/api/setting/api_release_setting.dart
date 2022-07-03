import 'api_setting.dart';

class ApiReleaseSetting extends ApiSetting {
  @override
  String get prefix => 'http';

  @override
  String get host => '192.168.0.123';

  @override
  int get port => 5000;
}
