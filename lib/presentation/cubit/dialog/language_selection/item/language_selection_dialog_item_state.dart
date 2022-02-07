part of 'language_selection_dialog_item_cubit.dart';

@immutable
abstract class LanguageSelectionDialogItemState {
  final String title;

  final String countryAssetPath;

  final EdgeInsets? padding;

  const LanguageSelectionDialogItemState(
      this.title, this.countryAssetPath, this.padding);
}

class LanguageSelectionDialogItemSelect
    extends LanguageSelectionDialogItemState {
  const LanguageSelectionDialogItemSelect(
      String title, String countryAssetPath, EdgeInsets? padding)
      : super(title, countryAssetPath, padding);
}

class LanguageSelectionDialogItemUnselect
    extends LanguageSelectionDialogItemState {
  const LanguageSelectionDialogItemUnselect(
      String title, String countryAssetPath, EdgeInsets? padding)
      : super(title, countryAssetPath, padding);
}
