import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:blur/blur.dart';

class CoinPageBalanceBoard extends StatelessWidget {
  final int balance;

  const CoinPageBalanceBoard({Key? key, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 80,
      decoration: BoxDecoration(
          color: HexColor('#634357'), borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [HexColor('#C0392B'), HexColor('#8E44AD')]),
            borderRadius: BorderRadius.circular(15)),
      ).blurred(
          blur: 15,
          borderRadius: BorderRadius.circular(15),
          blurColor: Colors.white,
          colorOpacity: 0.12),
    );
  }
}
