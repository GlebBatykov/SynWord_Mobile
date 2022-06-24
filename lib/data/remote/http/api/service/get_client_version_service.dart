import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/authorized_request.dart';
import '../model/response/get_client_version_response.dart';

class GetClientVersionService {
  Future<GetClientVersionResponse> getVersion(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.get('${ApiSetting.address}/clientAppVersion',
        options: options);

    return GetClientVersionResponse.fromJson(response.data);
  }
}
