import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignInDialog extends StatelessWidget {
  final Buttons button;

  final void Function() onPressed;

  const SignInDialog({Key? key, required this.button, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 235,
        height: 139,
        padding: const EdgeInsets.only(top: 26, bottom: 26),
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
            SignInButton(button, onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
