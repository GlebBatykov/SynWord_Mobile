import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/contraints_list/contraints_list.dart';
import '../../../../domain/repository/remote/contraints_list_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'model/response/get_contraints_list/get_contraints_list_response.dart';
import 'service/get_contraints_list_service.dart';

class ApiContraintsListRepository extends ContraintsListRemoteRepository {
  @override
  Future<ContraintsList> getContraintsList() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetContraintsListService().getContraintsList(request);

    return MapperBox.instanse
        .map<GetContraintsListResponse, ContraintsList>(response);
  }
}
