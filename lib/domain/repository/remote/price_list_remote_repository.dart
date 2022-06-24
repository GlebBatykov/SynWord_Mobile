import '../../model/price.dart';

abstract class PriceListRemoteRepository {
  Future<List<Price>> getPriceList();
}
