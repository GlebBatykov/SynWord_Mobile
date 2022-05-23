import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../asset/dialog/language_selection_dialog_asset.dart';
import '../../../model/dialog/language_selection/item_language.dart';
import '../../../model/dialog/language_selection/language_item_data.dart';
import 'item/language_selection_dialog_item_cubit.dart';

part 'language_selection_dialog_state.dart';

class LanguageSelectionDialogCubit extends Cubit<LanguageSelectionDialogState> {
  final List<LanguageSelectionDialogItemCubit> _itemCubits = [];

  final void Function(ItemLanguage)? _onSelect;

  late int _selectIndex;

  ItemLanguage get selected => _itemCubits[_selectIndex].language;

  LanguageSelectionDialogCubit({void Function(ItemLanguage)? onSelect})
      : _onSelect = onSelect,
        super(LanguageSelectionDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    var items = [
      LanguageItemData(
          ItemLanguage.english, LanguageSelectionDialogAsset.unitedStates),
      LanguageItemData(
          ItemLanguage.russian, LanguageSelectionDialogAsset.russia)
    ];

    for (var i = 0; i < items.length; i++) {
      _itemCubits.add(LanguageSelectionDialogItemCubit(
          i + 1, items[i].language, items[i].countryAssetPath,
          padding: i == 0 ? const EdgeInsets.only(bottom: 12) : null));
    }

    _itemCubits.first.select();

    _selectIndex = 0;

    emit(LanguageSelectionDialogShow(List.of(_itemCubits)));
  }

  void selectItem(int index) {
    for (var cubit in _itemCubits) {
      if (cubit.index == index) {
        cubit.select();

        _selectIndex = index;

        _onSelect?.call(cubit.language);
      } else {
        cubit.unselect();
      }
    }
  }
}
