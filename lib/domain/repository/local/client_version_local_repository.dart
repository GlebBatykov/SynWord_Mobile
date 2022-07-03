import 'package:synword/domain/model/client_version.dart';

abstract class ClientVersionLocalRepository {
  Future<ClientVersion> getVersion();
}
