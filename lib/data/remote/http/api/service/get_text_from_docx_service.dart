import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/get_text_from_docx_request.dart';
import '../model/response/get_text_from_docx_response.dart';

class GetTextFromDocxService {
  Future<GetTextFromDocxResponse> getTextFromDocx(
      GetTextFromDocxRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.post('${ApiSetting.address}/getTextFromDocx',
        data: FormData.fromMap(request.getBody()), options: options);

    return GetTextFromDocxResponse.fromJson(response.data);
  }
}
