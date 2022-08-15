import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/request/authorize/authorize_by_google_token_request.dart';
import '../../model/response/authorize/authorize_by_google_token_response.dart';
import '../../setting/api_setting.dart';

class AuthorizeByGoogleTokenService {
  Future<AuthorizeByGoogleTokenResponse> authorize(
      AuthorizeByGoogleTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/authViaGoogle',
        data: request.getBody(), options: options);

    return AuthorizeByGoogleTokenResponse.fromJson(response.data);
  }
}
