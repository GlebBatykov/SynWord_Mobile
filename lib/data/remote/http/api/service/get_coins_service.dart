import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/authorized_request.dart';
import '../model/response/get_coins_response.dart';

class GetCoinsService {
  Future<GetCoinsResponse> getCoins(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response =
        await dio.get('${ApiSetting.address}/balance', options: options);

    return GetCoinsResponse.fromJson(response.data);
  }
}
