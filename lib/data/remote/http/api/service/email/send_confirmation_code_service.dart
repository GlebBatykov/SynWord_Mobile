import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/request/authorized_request.dart';
import '../../setting/api_setting.dart';

class SendConfirmationCodeService {
  Future<void> send(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    await dio.post('${apiSetting.address}/sendConfirmationCode',
        options: options);
  }
}
