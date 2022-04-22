import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'history_page_state.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  HistoryPageCubit() : super(HistoryPageInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(HistoryPageSignIn());
  }
}
