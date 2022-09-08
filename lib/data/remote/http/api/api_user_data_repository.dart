import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/user/user_data.dart';
import '../../../../domain/repository/remote/user_data_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'model/response/get_user_data_response.dart';
import 'service/get_user_data_service.dart';

class ApiUserDataRepository extends UserDataRemoteRepository {
  @override
  Future<UserData> getUserData() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetUserDataService().getUserData(request);

    return MapperBox.instanse.map<GetUserDataResponse, UserData>(response);
  }
}
