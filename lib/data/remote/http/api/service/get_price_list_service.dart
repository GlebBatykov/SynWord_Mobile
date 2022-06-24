import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/authorized_request.dart';
import '../model/response/get_price_list/get_price_list_response.dart';

class GetPriceListService {
  Future<GetPriceListResponse> getPriceList(AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var response = await dio.get('${ApiSetting.address}/priceList', options: options);

    return GetPriceListResponse.fromJson(response.data);
  } 
}
