import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../domain/repository/remote/sing_in_remote_repository.dart';

part 'sign_in_page_state.dart';

class SignInPageCubit extends Cubit<SignInPageState> {
  late SignInRemoteRepository _signInRemoteRepository;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final Buttons _button;

  SignInPageCubit(Buttons button)
      : _button = button,
        super(SignInPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    _signInRemoteRepository =
        await GetIt.instance.getAsync<SignInRemoteRepository>();

    _show();
  }

  void showRegister() {}

  void _show() {
    emit(SignInPageShow(_formKey, _emailController, _passwordController,
        _signInOnPressed, _button, _serviceSignInOnPressed));
  }

  void _signInOnPressed() {
    _formKey.currentState!.validate();
  }

  void _serviceSignInOnPressed() async {
    await _signInRemoteRepository.signIn();

    Poseidon.instance.pop();
  }
}
