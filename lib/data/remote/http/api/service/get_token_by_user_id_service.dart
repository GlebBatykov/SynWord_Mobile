import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/request/get_token_by_user_id_request.dart';
import '../model/response/get_token_by_user_id_response.dart';

class GetTokenByUserIdService {
  Future<GetTokenByUserIdResponse> getToken(
      GetTokenByUserIdRequest request) async {
    var dio = Dio();

    var response = await dio.post('${ApiSetting.address}/guestAuthenticate',
        data: request.getBody());

    return GetTokenByUserIdResponse.fromJson(response.data);
  }
}
