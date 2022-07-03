import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_history/get_history_response.dart';
import '../setting/api_setting.dart';

class GetHistoryService {
  Future<GetHistoryResponse> getHistory(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response =
        await dio.post('${apiSetting.address}/getHistory', options: options);

    return GetHistoryResponse.fromJson(response.data);
  }
}
