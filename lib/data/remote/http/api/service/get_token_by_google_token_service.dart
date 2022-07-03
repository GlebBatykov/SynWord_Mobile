import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get_token_by_google_token_request.dart';
import '../model/response/get_token_by_google_token_response.dart';
import '../setting/api_setting.dart';

class GetTokenByGoogleTokenService {
  Future<GetTokenByGoogleTokenResponse> getToken(
      GetTokenByGoogleTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/googleAuthenticate',
        data: request.getBody(), options: options);

    return GetTokenByGoogleTokenResponse.fromJson(response.data);
  }
}
