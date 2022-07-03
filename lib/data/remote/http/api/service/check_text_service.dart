import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/check_text_request.dart';
import '../model/response/check_text/check_text_response.dart';
import '../setting/api_setting.dart';

class CheckTextService {
  Future<CheckTextResponse> checkText(CheckTextRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/plagiarismCheck',
        options: options, data: FormData.fromMap(request.getBody()));

    return CheckTextResponse.fromJson(response.data);
  }
}
