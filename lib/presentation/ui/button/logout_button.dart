import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../material_container.dart';

class LogoutButton extends StatelessWidget {
  final void Function()? onTap;

  const LogoutButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      width: 85,
      height: 40,
      color: HexColor('#F44336'),
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 2.5),
            color: Colors.black.withOpacity(0.6),
            blurRadius: 8)
      ],
      child: const Center(
        child: Text('Logout',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'Cabrion')),
      ),
      onTap: onTap,
    );
  }
}
