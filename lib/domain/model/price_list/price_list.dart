import 'price.dart';

class PriceList {
  final List<Price> prices;

  late final Price plagarismCheckPrice;

  late final Price rephrasePrice;

  late final Price enhancedRephrasePrice;

  PriceList(this.prices) {
    _initializePrices();
  }

  void _initializePrices() {
    for (var price in prices) {
      switch (price.name) {
        case ('PlagiarismCheckPrice'):
          plagarismCheckPrice = price;
          break;
        case ('RephrasePrice'):
          rephrasePrice = price;
          break;
        case ('EnhancedRephrasePrice'):
          enhancedRephrasePrice = price;
          break;
      }
    }
  }
}
