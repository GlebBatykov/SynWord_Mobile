part of 'language_selection_dialog_cubit.dart';

@immutable
abstract class LanguageSelectionDialogState {}

class LanguageSelectionDialogInitial extends LanguageSelectionDialogState {}

class LanguageSelectionDialogShow extends LanguageSelectionDialogState {
  final List<LanguageSelectionDialogItemCubit> itemCubits;

  LanguageSelectionDialogShow(this.itemCubits);
}
