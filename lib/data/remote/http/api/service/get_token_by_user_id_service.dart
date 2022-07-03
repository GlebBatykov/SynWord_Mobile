import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/request/get_token_by_user_id_request.dart';
import '../model/response/get_token_by_user_id_response.dart';
import '../setting/api_setting.dart';

class GetTokenByUserIdService {
  Future<GetTokenByUserIdResponse> getToken(
      GetTokenByUserIdRequest request) async {
    var dio = Dio();

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/guestAuthenticate',
        data: FormData.fromMap(request.getBody()));

    return GetTokenByUserIdResponse.fromJson(response.data);
  }
}
