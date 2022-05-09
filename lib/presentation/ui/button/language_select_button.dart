import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/ui/material_container.dart';

class LanguageSelectButton extends StatelessWidget {
  const LanguageSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      onTap: () {},
      width: 30,
      height: 18,
      borderRadius: BorderRadius.circular(3),
      color: HexColor('#DDC5A2'),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10)
      ],
      child: const Center(
          child: Text(
        'ENG',
        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
      )),
    );
  }
}
