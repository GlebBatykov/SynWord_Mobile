import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/check/check_result.dart';
import '../../../../domain/repository/remote/check_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/check_text_request.dart';
import 'model/response/check_text/check_text_response.dart';
import 'service/check_text_service.dart';

class ApiCheckRepository extends CheckRemoteRepository {
  @override
  Future<CheckResult> checkText(String text) async {
    var token = await GetTokenUseCase().getToken();

    var request = CheckTextRequest(text: text, token: token.token);

    var response = await CheckTextService().checkText(request);

    return MapperBox.instanse.map<CheckTextResponse, CheckResult>(response);
  }
}
