import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/coin/body/buttons/coin_page_body_buttons.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/coin/body/list/coin_page_body_list.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/page_body.dart';

class CoinPageBody extends StatelessWidget {
  const CoinPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBody(
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        child: Column(
          children: const [
            Expanded(child: CoinPageBodyList()),
            CoinPageBodyButtons()
          ],
        ));
  }
}
