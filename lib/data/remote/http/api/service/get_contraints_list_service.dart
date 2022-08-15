import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/authorized_request.dart';
import '../model/response/get_contraints_list/get_contraints_list_response.dart';
import '../setting/api_setting.dart';

class GetContraintsListService {
  Future<GetContraintsListResponse> getContraintsList(
      AuthorizedRequest request) async {
    var dio = Dio();

    var options = Options(headers: request.getHeaders());

    var apiSetting = GetIt.instance<ApiSetting>();

    var response =
        await dio.get('${apiSetting.address}/userContraints', options: options);

    return GetContraintsListResponse.fromJson(response.data);
  }
}
