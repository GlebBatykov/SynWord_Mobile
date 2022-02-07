import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/dialog/language_selection/item/language_selection_dialog_item_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/dialog/language_selection/language_selection_dialog_cubit.dart';

class LanguageSelectionDialogItem extends StatelessWidget {
  const LanguageSelectionDialogItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageSelectionDialogCubit =
        context.watch<LanguageSelectionDialogCubit>();

    var languageSelectionDialogItemCubit =
        context.watch<LanguageSelectionDialogItemCubit>();

    return BlocBuilder<LanguageSelectionDialogItemCubit,
        LanguageSelectionDialogItemState>(builder: (context, state) {
      var buttonAssetPath = '';

      if (state is LanguageSelectionDialogItemSelect) {
        buttonAssetPath =
            'assets/images/icons/language-selection-dialog/radio-button-filled.png';
      } else {
        buttonAssetPath =
            'assets/images/icons/language-selection-dialog/radio-button-not-filled.png';
      }

      return Padding(
          padding: state.padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Image.asset(buttonAssetPath, width: 17, height: 17)),
              InkWell(
                onTap: () {
                  languageSelectionDialogCubit
                      .selectItem(languageSelectionDialogItemCubit.index);
                },
                child: Container(
                    width: 132,
                    height: 35,
                    decoration: BoxDecoration(
                        color: HexColor('#C4C4C4'),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 3.5,
                              color: Colors.black.withOpacity(0.4))
                        ]),
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, top: 8, bottom: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.title,
                              style: const TextStyle(fontSize: 16)),
                          Image.asset(state.countryAssetPath,
                              width: 17, height: 17)
                        ])),
              )
            ],
          ));
    });
  }
}
