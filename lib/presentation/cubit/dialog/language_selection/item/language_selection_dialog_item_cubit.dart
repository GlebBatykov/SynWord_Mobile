import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../model/dialog/language_selection/item_language.dart';

part 'language_selection_dialog_item_state.dart';

class LanguageSelectionDialogItemCubit
    extends Cubit<LanguageSelectionDialogItemState> {
  final int index;

  final ItemLanguage language;

  final String _countryAssetPath;

  final EdgeInsets? _padding;

  bool _isSelected = false;

  LanguageSelectionDialogItemCubit(
      this.index, this.language, String countryAssetPath,
      {EdgeInsets? padding})
      : _countryAssetPath = countryAssetPath,
        _padding = padding,
        super(LanguageSelectionDialogItemUnselect(
            language.title, countryAssetPath, padding));

  void select() {
    if (!_isSelected) {
      emit(LanguageSelectionDialogItemSelect(
          language.title, _countryAssetPath, _padding));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(LanguageSelectionDialogItemUnselect(
          language.title, _countryAssetPath, _padding));

      _isSelected = false;
    }
  }
}
