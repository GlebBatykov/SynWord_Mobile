import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:synword/data/remote/http/api/setting/api_setting.dart';

import '../../model/request/confirm_email_request.dart';

class ConfirmEmailService {
  Future<void> confirm(ConfirmEmailRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    await dio.post('${apiSetting.address}/confirmEmail',
        options: options, data: FormData.fromMap(request.getBody()));
  }
}
