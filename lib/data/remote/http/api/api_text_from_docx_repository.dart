import 'package:dio/dio.dart';

import '../../../../domain/repository/remote/text_from_docx_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/get_text_from_docx_request.dart';
import 'service/get_text_from_docx_service.dart';

class ApiTextFromDocxRepository extends TextFromDocxRemoteRepository {
  @override
  Future<String> getTextFromDocx(MultipartFile file) async {
    var token = await GetTokenUseCase().getToken();

    var request = GetTextFromDocxRequest(file: file, token: token.token);

    var response = await GetTextFromDocxService().getTextFromDocx(request);
    return response.text;
  }
}
