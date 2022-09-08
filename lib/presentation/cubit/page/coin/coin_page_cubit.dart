import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repository/remote/user_data_remote_repository.dart';

part 'coin_page_state.dart';

class CoinPageCubit extends Cubit<CoinPageState> {
  late int _balance;

  CoinPageCubit() : super(CoinPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    emit(CoinPageLoad());

    var userDataRemoteRepository = GetIt.instance<UserDataRemoteRepository>();

    var userData = await userDataRemoteRepository.getUserData();

    _balance = userData.balance;

    emit(CoinPageShow(_balance));
  }
}
