import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/repository/remote/sing_in_remote_repository.dart';

part 'account_dialog_state.dart';

class AccountDialogCubit extends Cubit<AccountDialogState> {
  final String _username;

  final String _email;

  AccountDialogCubit(String username, String email)
      : _username = username,
        _email = email,
        super(AccountDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(AccountDialogShow(_username, _email, _onTap));
  }

  void _onTap() async {
    var signInRemoteRepository = GetIt.instance<SignInRemoteRepository>();

    await signInRemoteRepository.logout();
  }
}
