import '../../../../domain/repository/remote/coins_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'service/get_coins_service.dart';

class ApiCoinsRepository extends CoinsRemoteRepository {
  @override
  Future<int> getCoins() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetCoinsService().getCoins(request);

    return response.coins;
  }
}
