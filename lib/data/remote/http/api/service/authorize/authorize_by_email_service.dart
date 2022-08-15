import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/request/authorize/authorize_by_email_request.dart';
import '../../model/response/authorize/authorize_by_email_response.dart';
import '../../setting/api_setting.dart';

class AuthorizeByEmailService {
  Future<AuthorizeByEmailResponse> authorize(
      AuthorizeByEmailRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/authVieEmail',
        options: options, data: FormData.fromMap(request.getBody()));

    return AuthorizeByEmailResponse.fromJson(response.data);
  }
}
