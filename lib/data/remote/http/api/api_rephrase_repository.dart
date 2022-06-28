import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/enum/rephrase_language.dart';
import '../../../../domain/model/result/rephrase/rephrase_result.dart';
import '../../../../domain/repository/remote/rephrase_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/rephrase_text_request.dart';
import 'model/response/rephrase_text/rephrase_text_response.dart';
import 'service/rephrase_text_service.dart';

class ApiRephraseRepository extends RephraseRemoteRepository {
  @override
  Future<RephraseResult> rephraseText(
      String text, RephraseLanguage language) async {
    var token = await GetTokenUseCase().getToken();

    var request =
        RephraseTextRequest(text: text, language: language, token: token.token);

    var response = await RephraseTextService().rephraseText(request);

    return MapperBox.instanse
        .map<RephraseTextResponse, RephraseResult>(response);
  }
}
