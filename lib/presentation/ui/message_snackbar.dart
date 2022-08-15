import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

class MessageSnackBar extends SnackBar {
  MessageSnackBar({Key? key, required String message})
      : super(
            key: key,
            content: Text(message, style: const TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
                label: 'Hide',
                textColor: Colors.black,
                onPressed: () {
                  Poseidon.instance.hideCurrentSnackBar();
                }),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))));
}
