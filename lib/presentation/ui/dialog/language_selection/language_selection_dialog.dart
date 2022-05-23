import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/dialog/language_selection/item/language_selection_dialog_item_cubit.dart';
import '../../../cubit/dialog/language_selection/language_selection_dialog_cubit.dart';
import 'language_selection_dialog_item.dart';

class LanguageSelectionDialog extends StatelessWidget {
  const LanguageSelectionDialog({Key? key}) : super(key: key);

  List<Widget> _buildItems(List<LanguageSelectionDialogItemCubit> itemCubits) {
    var widgets = <Widget>[];

    for (var cubit in itemCubits) {
      widgets.add(BlocProvider<LanguageSelectionDialogItemCubit>.value(
          value: cubit, child: const LanguageSelectionDialogItem()));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 170,
        width: 234,
        padding:
            const EdgeInsets.only(left: 27, right: 34, top: 44, bottom: 44),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: BlocBuilder<LanguageSelectionDialogCubit,
            LanguageSelectionDialogState>(builder: (context, state) {
          if (state is LanguageSelectionDialogShow) {
            return Column(
              children: _buildItems(state.itemCubits),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
