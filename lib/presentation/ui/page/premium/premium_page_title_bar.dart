import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/asset/premium_page_asset.dart';

import '../page_title_bar.dart';

class PremiumPageTitleBar extends StatelessWidget {
  const PremiumPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      center: Image.asset(PremiumPageAsset.crown),
    );
  }
}
