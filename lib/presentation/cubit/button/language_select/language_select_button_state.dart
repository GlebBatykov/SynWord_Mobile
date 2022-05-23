part of 'language_select_button_cubit.dart';

@immutable
abstract class LanguageSelectButtonState {}

class LanguageSelectButtonInitial extends LanguageSelectButtonState {}

class LanguageSelectButtonShow extends LanguageSelectButtonState {
  final String title;

  final LanguageSelectionDialogCubit selectionDialogCubit;

  LanguageSelectButtonShow(this.title, this.selectionDialogCubit);
}
