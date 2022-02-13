import 'package:flutter/material.dart';

class PremiumPageBodyButton extends StatelessWidget {
  final String title;

  final Color color;

  final void Function()? onPressed;

  const PremiumPageBodyButton(
      {Key? key, required this.title, required this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            shadowColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.7)),
            backgroundColor: MaterialStateProperty.all(color),
            minimumSize: MaterialStateProperty.all(const Size(143, 24)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6))),
        child: Text(title,
            style: const TextStyle(fontSize: 10, color: Colors.black)));
  }
}
