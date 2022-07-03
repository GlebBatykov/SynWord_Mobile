import '../../model/price_list/price_list.dart';

abstract class PriceListRemoteRepository {
  Future<PriceList> getPriceList();
}
