import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../asset/dialog/rephrase_dialog_asset.dart';
import '../../../asset/icon_asset.dart';
import '../../../asset/premium_page_asset.dart';
import '../../../cubit/button/language_select/language_select_button_cubit.dart';
import '../../button/language_select_button.dart';
import 'rephrase_dialog_item.dart';

class RephraseDialog extends StatelessWidget {
  const RephraseDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 235,
        height: 276,
        padding: const EdgeInsets.only(left: 5, right: 4, top: 15, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(children: [
                    Image.asset(IconAsset.wallet, width: 15, height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('10', style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Image.asset(PremiumPageAsset.coins,
                            width: 20, height: 20))
                  ])),
              Container(
                height: 1,
                color: Colors.black.withOpacity(0.5),
              ),
              const RephraseDialogItem(
                  title: 'Plagiarism check price', price: 5),
              const RephraseDialogItem(
                  title: 'Rephrase price',
                  subtitle: 'price for every 20,000 characters',
                  price: 3),
              const RephraseDialogItem(
                  title: 'Rephrase premium price',
                  subtitle: 'price for every 1000 characters',
                  price: 3),
              Container(
                height: 32,
                margin: const EdgeInsets.only(left: 5, right: 6),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: HexColor('C4C4C4').withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(RephraseDialogAsset.language,
                              width: 20, height: 20),
                          const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Rephrase language',
                                  style: TextStyle(fontSize: 12)))
                        ],
                      ),
                      BlocProvider(
                          create: (context) => LanguageSelectButtonCubit(),
                          child: const LanguageSelectButton())
                    ]),
              )
            ]),
      ),
    );
  }
}
