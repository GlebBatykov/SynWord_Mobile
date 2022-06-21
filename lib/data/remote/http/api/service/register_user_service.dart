import 'package:dio/dio.dart';

import '../api_setting.dart';
import '../model/response/register_user_response.dart';

class RegisterUserService {
  Future<RegisterUserResponse> register() async {
    var dio = Dio();

    var response = await dio.post('${ApiSetting.address}/guestRegister');

    return RegisterUserResponse.fromJson(response.data);
  }
}
