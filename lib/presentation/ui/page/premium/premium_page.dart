import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/body/premium_page_body.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/premium_page_title_bar.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      body: Column(
        children: const [
          PremiumPageTitleBar(),
          Expanded(child: PremiumPageBody())
        ],
      ),
    );
  }
}
