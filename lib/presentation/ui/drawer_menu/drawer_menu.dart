import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword/presentation/ui/dialog/language_selection/language_selection_dialog.dart';

import '../../asset/menu_asset.dart';
import '../../navigation/navigation_routes.dart';
import '../page/pages_properties.dart';
import 'drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 122,
      child: Drawer(
        child: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 28, bottom: 28)
                  .add(PagesProperties.margin),
          color: Colors.black,
          child: Column(
            children: [
              DrawerMenuItem(
                imageName: MenuAsset.clock,
                imagePadding: const EdgeInsets.only(top: 6),
                title: 'History',
                onPress: () {
                  Poseidon.instance.navigate(NavigationRoutes.historyPage);
                },
              ),
              DrawerMenuItem(
                  imageName: MenuAsset.premium,
                  imagePadding: const EdgeInsets.only(top: 6),
                  title: 'Premium',
                  onPress: () {
                    Poseidon.instance.navigate(NavigationRoutes.premiumPage);
                  },
                  padding: const EdgeInsets.only(top: 42)),
              DrawerMenuItem(
                  imageName: MenuAsset.wallet,
                  imagePadding: const EdgeInsets.only(top: 6),
                  title: 'Balance',
                  onPress: () {
                    Poseidon.instance.navigate(NavigationRoutes.coinPage);
                  },
                  padding: const EdgeInsets.only(top: 20)),
              DrawerMenuItem(
                  imageName: MenuAsset.languages,
                  imagePadding: const EdgeInsets.only(top: 6),
                  title: 'Language',
                  onPress: () {
                    Poseidon.instance.callDialog(
                        (context) => const LanguageSelectionDialog());
                  },
                  padding: const EdgeInsets.only(top: 42)),
              DrawerMenuItem(
                  imageName: MenuAsset.feedback,
                  imagePadding: const EdgeInsets.only(top: 6),
                  title: 'Feedback',
                  onPress: () {},
                  padding: const EdgeInsets.only(top: 20)),
              DrawerMenuItem(
                  imageName: MenuAsset.website,
                  title: 'Website',
                  onPress: () {},
                  padding: const EdgeInsets.only(top: 42))
            ],
          ),
        ),
      ),
    );
  }
}
