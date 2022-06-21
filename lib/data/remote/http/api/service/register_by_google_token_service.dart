import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/register_by_google_token_request.dart';

class RegisterByGoogleTokenService {
  Future<void> register(RegisterByGoogleTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    await dio.post('${ApiSetting.address}/googleRegister',
        data: request.getBody(), options: options);
  }
}
