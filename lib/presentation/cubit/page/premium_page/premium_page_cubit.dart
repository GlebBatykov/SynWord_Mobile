import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'premium_page_state.dart';

class PremiumPageCubit extends Cubit<PremiumPageState> {
  PremiumPageCubit() : super(PremiumPageInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(PremiumPageGoldActive());
  }
}
