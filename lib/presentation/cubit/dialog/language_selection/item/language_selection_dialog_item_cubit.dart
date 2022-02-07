import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'language_selection_dialog_item_state.dart';

class LanguageSelectionDialogItemCubit
    extends Cubit<LanguageSelectionDialogItemState> {
  final int index;

  final String _title;

  final String _countryAssetPath;

  final EdgeInsets? _padding;

  bool _isSelected = false;

  LanguageSelectionDialogItemCubit(
      this.index, String title, String countryAssetPath,
      {EdgeInsets? padding})
      : _title = title,
        _countryAssetPath = countryAssetPath,
        _padding = padding,
        super(LanguageSelectionDialogItemUnselect(
            title, countryAssetPath, padding));

  void select() {
    if (!_isSelected) {
      emit(LanguageSelectionDialogItemSelect(
          _title, _countryAssetPath, _padding));

      _isSelected = true;
    }
  }

  void unselect() {
    if (_isSelected) {
      emit(LanguageSelectionDialogItemUnselect(
          _title, _countryAssetPath, _padding));

      _isSelected = false;
    }
  }
}
