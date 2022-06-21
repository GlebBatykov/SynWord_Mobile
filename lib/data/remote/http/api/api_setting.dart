abstract class ApiSetting {
  static const String prefix = 'http';

  static const String host = '10.0.2.2';

  static const int port = 5000;

  static String get address => '$prefix://$host:$port';
}
