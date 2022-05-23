import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

import '../../asset/icon_asset.dart';
import '../dialog/rephrase/rephrase_dialog.dart';
import '../dialog/upload_file_dialog.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 21, right: 20.31, top: 19),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 4), blurRadius: 5)
            ]),
            child: Image.asset(
              IconAsset.hamburger,
              width: 39.44,
              height: 20,
            ),
          ),
          onTap: () {
            Poseidon.instance.openDrawer();
          },
        ),
        const Text(
          'synword',
          style: TextStyle(
              fontSize: 33,
              fontFamily: 'Waxe',
              color: Colors.white,
              shadows: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 4), blurRadius: 5)
              ]),
        ),
        InkWell(
          onTap: () {
            Poseidon.instance.callDialog((context) {
              return const UploadFileDialog();
            });
          },
          child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 4), blurRadius: 5)
              ]),
              child: Image.asset(IconAsset.upload, width: 30.69, height: 36)),
        )
      ]),
    );
  }
}
