import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/rephrase_text_request.dart';
import '../model/response/rephrase_text/rephrase_text_response.dart';

class RephraseTextService {
  Future<RephraseTextResponse> rephraseText(RephraseTextRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.post('${ApiSetting.address}//rephrase',
        options: options, data: FormData.fromMap(request.getBody()));

    return RephraseTextResponse.fromJson(response.data);
  }
}
