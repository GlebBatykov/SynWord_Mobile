abstract class ApiSetting {
  String get prefix;

  String get host;

  int get port;

  String get address => '$prefix://$host:$port';
}
