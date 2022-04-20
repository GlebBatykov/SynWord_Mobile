import 'package:flutter/material.dart';

import '../page_title_bar.dart';

class PremiumPageTitleBar extends StatelessWidget {
  const PremiumPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      center: Image.asset('assets/images/premium-page/crown.png'),
    );
  }
}
