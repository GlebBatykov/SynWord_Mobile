import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coin_page_state.dart';

class CoinPageCubit extends Cubit<CoinPageState> {
  late int _balance;

  CoinPageCubit() : super(CoinPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _balance = 100;

    emit(CoinPageShow(_balance));
  }
}
