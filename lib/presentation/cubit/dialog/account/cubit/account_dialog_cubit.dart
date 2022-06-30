import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/repository/local/user_local_repository.dart';

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
    var userLocalRepository = GetIt.instance<UserLocalRepository>();

    var user = userLocalRepository.getUser();
  }
}
