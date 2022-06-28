part of 'coin_page_cubit.dart';

@immutable
abstract class CoinPageState {}

class CoinPageInitial extends CoinPageState {}

class CoinPageLoad extends CoinPageState {}

class CoinPageShow extends CoinPageState {
  final int balance;

  CoinPageShow(this.balance);
}
