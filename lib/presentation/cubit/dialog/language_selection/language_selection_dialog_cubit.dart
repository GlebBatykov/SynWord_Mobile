import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/asset/dialog/language_selection_dialog_asset.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/dialog/language_selection/item/language_selection_dialog_item_cubit.dart';

import '../../../model/dialog/language_selection/language_item_data.dart';

part 'language_selection_dialog_state.dart';

class LanguageSelectionDialogCubit extends Cubit<LanguageSelectionDialogState> {
  final List<LanguageSelectionDialogItemCubit> _itemCubits = [];

  LanguageSelectionDialogCubit() : super(LanguageSelectionDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    var items = [
      LanguageItemData('English', LanguageSelectionDialogAsset.unitedStates),
      LanguageItemData('Russian', LanguageSelectionDialogAsset.russia)
    ];

    for (var i = 0; i < items.length; i++) {
      _itemCubits.add(LanguageSelectionDialogItemCubit(
          i + 1, items[i].title, items[i].countryAssetPath,
          padding: i == 0 ? const EdgeInsets.only(bottom: 12) : null));
    }

    _itemCubits.first.select();

    emit(LanguageSelectionDialogShow(List.of(_itemCubits)));
  }

  void selectItem(int index) {
    for (var cubit in _itemCubits) {
      if (cubit.index == index) {
        cubit.select();
      } else {
        cubit.unselect();
      }
    }
  }
}
