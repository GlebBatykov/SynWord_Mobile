import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../model/response/register_user_response.dart';
import '../../setting/api_setting.dart';

class RegisterUserService {
  Future<RegisterUserResponse> register() async {
    var dio = Dio();

    var apiSetting = GetIt.instance<ApiSetting>();

    var response = await dio.post('${apiSetting.address}/guestRegister');

    return RegisterUserResponse.fromJson(response.data);
  }
}
