import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/enhanced_rephrase_text_request.dart';
import '../model/request/rephrase_text_request.dart';
import '../model/response/rephrase_text/enhanced_rephrase_text_response.dart';
import '../model/response/rephrase_text/rephrase_text_response.dart';
import '../setting/api_setting.dart';

class RephraseTextService {
  Future<RephraseTextResponse> rephraseText(RephraseTextRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/rephrase',
        options: options, data: FormData.fromMap(request.getBody()));

    return RephraseTextResponse.fromJson(response.data);
  }

  Future<EnhancedRephraseTextResponse> enhancedRephraseText(
      EnhancedRephraseTextRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/enhancedRephrase',
        options: options, data: FormData.fromMap(request.getBody()));

    return EnhancedRephraseTextResponse.fromJson(response.data);
  }
}
