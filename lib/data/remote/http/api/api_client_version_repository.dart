import 'package:synword/data/remote/http/api/model/request/authorized_request.dart';
import 'package:synword/data/remote/http/api/service/get_client_version_service.dart';
import 'package:synword/domain/model/client_version.dart';
import 'package:synword/domain/use_case/get_token_use_case.dart';

import '../../../../domain/repository/remote/client_version_remote_repository.dart';

class ApiClientVersionRepository extends ClientVersionRemoteRepository {
  @override
  Future<ClientVersion> getVersion() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetClientVersionService().getVersion(request);

    return ClientVersion(response.clientAppVersion);
  }
}
