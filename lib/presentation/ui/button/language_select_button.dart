import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:poseidon/poseidon.dart';

import '../../cubit/button/language_select/language_select_button_cubit.dart';
import '../../cubit/dialog/language_selection/language_selection_dialog_cubit.dart';
import '../dialog/language_selection/language_selection_dialog.dart';
import '../material_container.dart';

class LanguageSelectButton extends StatelessWidget {
  const LanguageSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSelectButtonCubit, LanguageSelectButtonState>(
        builder: (context, state) {
      if (state is LanguageSelectButtonShow) {
        return MaterialContainer(
          onTap: () {
            Poseidon.instance.callDialog((context) =>
                BlocProvider<LanguageSelectionDialogCubit>.value(
                    value: state.selectionDialogCubit,
                    child: const LanguageSelectionDialog()));
          },
          width: 30,
          height: 18,
          borderRadius: BorderRadius.circular(3),
          color: HexColor('#DDC5A2'),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10)
          ],
          child: Center(
              child: Text(
            state.title,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
          )),
        );
      } else {
        return Container();
      }
    });
  }
}
