import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/price_list/price.dart';
import '../../../../domain/model/price_list/price_list.dart';
import '../../../../domain/repository/remote/price_list_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'model/response/get_price_list/price_item.dart';
import 'service/get_price_list_service.dart';

class ApiPriceListRepository extends PriceListRemoteRepository {
  @override
  Future<PriceList> getPriceList() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    var response = await GetPriceListService().getPriceList(request);

    return PriceList(response.prices
        .map((e) => MapperBox.instanse.map<PriceItem, Price>(e))
        .toList());
  }
}
