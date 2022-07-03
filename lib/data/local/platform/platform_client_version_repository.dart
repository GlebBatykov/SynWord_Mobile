import 'package:package_info_plus/package_info_plus.dart';

import '../../../domain/model/client_version.dart';
import '../../../domain/repository/local/client_version_local_repository.dart';

class PlatformClientVersionRepository extends ClientVersionLocalRepository {
  @override
  Future<ClientVersion> getVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();

    return ClientVersion(packageInfo.version);
  }
}
