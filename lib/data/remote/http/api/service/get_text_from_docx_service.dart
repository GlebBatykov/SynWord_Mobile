import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get_text_from_docx_request.dart';
import '../model/response/get_text_from_docx_response.dart';
import '../setting/api_setting.dart';

class GetTextFromDocxService {
  Future<GetTextFromDocxResponse> getTextFromDocx(
      GetTextFromDocxRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/getTextFromDocx',
        data: FormData.fromMap(request.getBody()), options: options);

    return GetTextFromDocxResponse.fromJson(response.data);
  }
}
