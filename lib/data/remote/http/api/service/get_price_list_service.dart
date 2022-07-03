import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_price_list/get_price_list_response.dart';
import '../setting/api_setting.dart';

class GetPriceListService {
  Future<GetPriceListResponse> getPriceList(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response =
        await dio.get('${apiSetting.address}/priceList', options: options);

    return GetPriceListResponse.fromJson(response.data);
  }
}
