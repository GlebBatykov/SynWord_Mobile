import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/check_text_request.dart';
import '../model/response/check_text/check_text_response.dart';

class CheckTextService {
  Future<CheckTextResponse> checkText(CheckTextRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.post('${ApiSetting.address}/plagiarismCheck',
        options: options, data: FormData.fromMap(request.getBody()));

    return CheckTextResponse.fromJson(response.data);
  }
}
