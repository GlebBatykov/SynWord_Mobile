import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/get_token_by_google_token_request.dart';
import '../model/response/get_token_by_google_token_response.dart';

class GetTokenByGoogleTokenService {
  Future<GetTokenByGoogleTokenResponse> getToken(
      GetTokenByGoogleTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.post('${ApiSetting.address}/googleAuthenticate',
        data: request.getBody(), options: options);

    return GetTokenByGoogleTokenResponse.fromJson(response.data);
  }
}
