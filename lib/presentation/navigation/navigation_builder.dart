import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/premium/premium_page.dart';

class NavigationBuilder extends PoseidonBuilder {
  @override
  Poseidon build() {
    var poseidon = Poseidon();

    poseidon.createRoutes(routes: [
      PoseidonRoute(
          path: '/premium',
          builder: (context, arguments) {
            return MaterialPageRoute(builder: (context) => const PremiumPage());
          })
    ]);

    return poseidon;
  }
}
