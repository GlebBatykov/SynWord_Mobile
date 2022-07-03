import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/model/user/user_info.dart';
import '../../../../../domain/repository/remote/sing_in_remote_repository.dart';
import '../../../../ui/dialog/account_dialog.dart';
import '../../../../ui/dialog/sign_in_dialog.dart';
import '../../../dialog/account/cubit/account_dialog_cubit.dart';

part 'account_button_state.dart';

class AccountButtonCubit extends Cubit<AccountButtonState> {
  late SignInRemoteRepository _signInRemoteRepository;

  AccountButtonCubit() : super(AccountButtonInitial()) {
    _initialize();
  }

  void _initialize() async {
    _signInRemoteRepository =
        await GetIt.instance.getAsync<SignInRemoteRepository>();

    emit(AccountButtonShow(_onTap));
  }

  void _onTap() {
    var userAuthorizationData = _signInRemoteRepository.getAuthorizationData();

    if (userAuthorizationData == null) {
      _callSignInDialog();
    } else {
      _callAccountDialog(userAuthorizationData.info);
    }
  }

  void _callSignInDialog() {
    late Buttons button;

    if (Platform.isAndroid) {
      button = Buttons.Google;
    } else if (Platform.isIOS) {
      button = Buttons.Apple;
    }

    Poseidon.instance.callDialog((context) =>
        SignInDialog(button: button, onPressed: _signInButtonOnPressed));
  }

  void _signInButtonOnPressed() async {
    await _signInRemoteRepository.signIn();

    Poseidon.instance.pop();
  }

  void _callAccountDialog(UserInfo userInfo) {
    Poseidon.instance.callDialog((context) => BlocProvider(
        create: (context) =>
            AccountDialogCubit(userInfo.username, userInfo.email),
        child: const AccountDialog()));
  }
}
