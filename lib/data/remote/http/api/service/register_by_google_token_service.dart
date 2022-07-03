import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/register_by_google_token_request.dart';
import '../setting/api_setting.dart';

class RegisterByGoogleTokenService {
  Future<void> register(RegisterByGoogleTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    await dio.post('${apiSetting.address}/googleRegister',
        data: request.getBody(), options: options);
  }
}
