import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_client_version_response.dart';
import '../setting/api_setting.dart';

class GetClientVersionService {
  Future<GetClientVersionResponse> getVersion(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.get('${apiSetting.address}/clientAppVersion',
        options: options);

    return GetClientVersionResponse.fromJson(response.data);
  }
}
