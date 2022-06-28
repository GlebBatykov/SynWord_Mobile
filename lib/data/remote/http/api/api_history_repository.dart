import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/history/history.dart';
import '../../../../domain/repository/remote/history_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'model/response/get_history/get_history_response.dart';
import 'service/get_history_service.dart';

class ApiHistoryRepository extends HistoryRemoteRepository {
  @override
  Future<History> getHistory() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetHistoryService().getHistory(request);

    return MapperBox.instanse.map<GetHistoryResponse, History>(response);
  }
}
