part of 'account_dialog_cubit.dart';

@immutable
abstract class AccountDialogState {}

class AccountDialogInitial extends AccountDialogState {}

class AccountDialogShow extends AccountDialogState {
  final String username;

  final String email;

  final void Function() onTap;

  AccountDialogShow(this.username, this.email, this.onTap);
}
