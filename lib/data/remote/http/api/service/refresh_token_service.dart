import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/refresh_token_request.dart';
import '../model/response/refresh_token_response.dart';
import '../setting/api_setting.dart';

class RefreshTokenService {
  Future<RefreshTokenResponse> refresh(RefreshTokenRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/refreshToken',
        options: options, data: FormData.fromMap(request.getBody()));

    return RefreshTokenResponse.fromJson(response.data);
  }
}
