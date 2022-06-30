part of 'account_button_cubit.dart';

@immutable
abstract class AccountButtonState {}

class AccountButtonInitial extends AccountButtonState {}

class AccountButtonShow extends AccountButtonState {
  final void Function() onTap;

  AccountButtonShow(this.onTap);
}
