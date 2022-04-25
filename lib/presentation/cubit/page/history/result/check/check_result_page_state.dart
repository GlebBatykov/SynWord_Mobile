part of 'check_result_page_cubit.dart';

@immutable
abstract class CheckResultPageState {}

class CheckResultPageInitial extends CheckResultPageState {}

class CheckResultPageShow extends CheckResultPageState {
  final int percentages;

  CheckResultPageShow(this.percentages);
}
