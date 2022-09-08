import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_user_data_response.dart';
import '../setting/api_setting.dart';

class GetUserDataService {
  Future<GetUserDataResponse> getUserData(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response =
        await dio.get('${apiSetting.address}/getUserData', options: options);

    return GetUserDataResponse.fromJson(response.data);
  }
}
