part of 'sign_in_page_cubit.dart';

@immutable
abstract class SignInPageState {}

class SignInPageInitial extends SignInPageState {}

class SignInPageShow extends SignInPageState {
  final GlobalKey<FormState> formKey;

  final TextEditingController loginController;

  final TextEditingController passwordController;

  final void Function() singInOnPressed;

  final Buttons serviceButton;

  final void Function() serviceSignInOnPressed;

  SignInPageShow(this.formKey, this.loginController, this.passwordController,
      this.singInOnPressed, this.serviceButton, this.serviceSignInOnPressed);
}

class SignInPageRegister extends SignInPageState {}
