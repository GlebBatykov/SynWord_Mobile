import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repository/remote/coins_remote_repository.dart';

part 'coin_page_state.dart';

class CoinPageCubit extends Cubit<CoinPageState> {
  late int _balance;

  CoinPageCubit() : super(CoinPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    emit(CoinPageLoad());

    var coinsRemoteRepository = GetIt.instance<CoinsRemoteRepository>();

    _balance = await coinsRemoteRepository.getCoins();

    emit(CoinPageShow(_balance));
  }
}
