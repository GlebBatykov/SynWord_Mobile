import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/repository/remote/sing_in_remote_repository.dart';
import '../../../../ui/dialog/sign_in_dialog.dart';

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
      _callAccountDialog();
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
  }

  void _callAccountDialog() {
    //Poseidon.instance.navigate();
  }
}
