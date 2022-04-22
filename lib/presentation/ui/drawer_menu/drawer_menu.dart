import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/drawer_menu/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 122,
      child: Drawer(
        child: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 28, bottom: 28),
          color: Colors.black,
          child: Column(
            children: [
              DrawerMenuItem(
                imageName: 'assets/images/icons/menu/clock.png',
                title: 'History',
                onPress: () {
                  Poseidon.navigate('/history');
                },
              ),
              DrawerMenuItem(
                  imageName: 'assets/images/icons/menu/premium.png',
                  title: 'Premium',
                  onPress: () {
                    Poseidon.navigate('/premium');
                  },
                  padding: const EdgeInsets.only(top: 42)),
              DrawerMenuItem(
                  imageName: 'assets/images/icons/menu/wallet.png',
                  title: 'Balance',
                  onPress: () {
                    Poseidon.navigate('/coin');
                  },
                  padding: const EdgeInsets.only(top: 20)),
              DrawerMenuItem(
                  imageName: 'assets/images/icons/menu/languages.png',
                  title: 'Language',
                  onPress: () {},
                  padding: const EdgeInsets.only(top: 42)),
              DrawerMenuItem(
                  imageName: 'assets/images/icons/menu/feedback.png',
                  title: 'Feedback',
                  onPress: () {},
                  padding: const EdgeInsets.only(top: 20)),
              DrawerMenuItem(
                  imageName: 'assets/images/icons/menu/instagram.png',
                  title: 'Instagram',
                  onPress: () {},
                  padding: const EdgeInsets.only(top: 42))
            ],
          ),
        ),
      ),
    );
  }
}
