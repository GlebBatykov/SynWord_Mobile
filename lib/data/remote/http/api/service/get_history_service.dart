import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/authorized_request.dart';
import '../model/response/get_history/get_history_response.dart';

class GetHistoryService {
  Future<GetHistoryResponse> getHistory(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response =
        await dio.post('${ApiSetting.address}/getHistory', options: options);

    return GetHistoryResponse.fromJson(response.data);
  }
}
