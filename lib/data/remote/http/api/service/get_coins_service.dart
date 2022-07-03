import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_coins_response.dart';
import '../setting/api_setting.dart';

class GetCoinsService {
  Future<GetCoinsResponse> getCoins(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response =
        await dio.get('${apiSetting.address}/balance', options: options);

    return GetCoinsResponse.fromJson(response.data);
  }
}
