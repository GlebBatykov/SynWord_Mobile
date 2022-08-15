import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/request/authorize/authorize_by_user_id_request.dart';
import '../../model/response/authorize/authorize_by_user_id_response.dart';
import '../../setting/api_setting.dart';

class AuthorizeByUserIdService {
  Future<AuthorizeByUserIdResponse> authorize(
      AuthorizeByUserIdRequest request) async {
    var dio = Dio();

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/guestAuth',
        data: FormData.fromMap(request.getBody()));

    return AuthorizeByUserIdResponse.fromJson(response.data);
  }
}
