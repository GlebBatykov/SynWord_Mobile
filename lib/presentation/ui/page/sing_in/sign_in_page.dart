import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../cubit/dialog/sing_in/sign_in_page_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  String? _validateLogin(String? text) {
    if (text == null || text.isEmpty) {
      return 'Should not be empty';
    }

    return null;
  }

  String? _validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Should not be empty';
    }

    return null;
  }

  Widget _buildTextField(String label, TextEditingController controller,
      String? Function(String?)? validator) {
    return TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            labelText: label,
            errorStyle: const TextStyle(fontFamily: 'Cabrion', fontSize: 12),
            labelStyle: const TextStyle(
                fontFamily: 'Cabrion', fontSize: 14, color: Colors.black)));
  }

  Widget _buildButton(String title, Color backgroundColor, Color textColor,
      void Function() onPressed) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            shadowColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.7)),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6))),
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
                fontFamily: 'Cabrion', fontSize: 14, color: textColor)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInPageCubit, SignInPageState>(
        builder: (context, state) {
      if (state is SignInPageShow) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: 235,
            height: 360,
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 15)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('AUTHORIZATION',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Audrey',
                        fontWeight: FontWeight.w700)),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Form(
                        key: state.formKey,
                        child: Column(children: [
                          _buildTextField(
                              'Login', state.loginController, _validateLogin),
                          const SizedBox(height: 15),
                          _buildTextField('Password', state.passwordController,
                              _validatePassword),
                        ])),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton('Sign in', HexColor('#C99E10'),
                            Colors.black, state.singInOnPressed),
                        const SizedBox(width: 15),
                        _buildButton(
                            'Sign up', HexColor('#C0C0C0'), Colors.black, () {})
                      ],
                    ),
                    SignInButton(state.serviceButton,
                        onPressed: state.serviceSignInOnPressed),
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
