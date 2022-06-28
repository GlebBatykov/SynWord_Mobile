part of 'history_page_cubit.dart';

@immutable
abstract class HistoryPageBodyState {}

class HistoryPageInitial extends HistoryPageBodyState {}

class HistoryPageLoad extends HistoryPageBodyState {}

class HistoryPageSignIn extends HistoryPageBodyState {}

class HistoryPageShow extends HistoryPageBodyState {
  final List<HistoryPageBodyResultItemCubit> itemsCubits;

  HistoryPageShow(this.itemsCubits);
}
