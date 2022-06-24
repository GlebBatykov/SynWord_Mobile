import '../../model/client_version.dart';

abstract class ClientVersionRemoteRepository {
  Future<ClientVersion> getVersion();
}
