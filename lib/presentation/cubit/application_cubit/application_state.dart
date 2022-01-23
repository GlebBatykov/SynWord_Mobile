part of 'application_cubit.dart';

@immutable
abstract class ApplicationState {}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoad extends ApplicationState {}

class ApplicationUpdate extends ApplicationState {
  final UpdateScreenCubit updateScreenCubit;

  ApplicationUpdate(this.updateScreenCubit);
}

class ApplicationWork extends ApplicationState {}
