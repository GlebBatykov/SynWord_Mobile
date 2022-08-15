import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/request/register/register_by_email_request.dart';
import '../../setting/api_setting.dart';

class RegisterByEmailService {
  Future<void> register(RegisterByEmailRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    await dio.post('${apiSetting.address}/registerViaEmail',
        options: options, data: FormData.fromMap(request.getBody()));
  }
}
