import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/dialog/language_selection/item_language.dart';
import '../../dialog/language_selection/language_selection_dialog_cubit.dart';

part 'language_select_button_state.dart';

class LanguageSelectButtonCubit extends Cubit<LanguageSelectButtonState> {
  late final LanguageSelectionDialogCubit _selectionDialogCubit;

  final void Function(ItemLanguage)? _onSelect;

  late String _title;

  ItemLanguage get current => _selectionDialogCubit.selected;

  LanguageSelectButtonCubit({void Function(ItemLanguage)? onSelect})
      : _onSelect = onSelect,
        super(LanguageSelectButtonInitial()) {
    _initialize();
  }

  void _initialize() {
    _selectionDialogCubit =
        LanguageSelectionDialogCubit(onSelect: _onDialogSelect);

    _title = _selectionDialogCubit.selected.shortTitle;

    _show();
  }

  void _onDialogSelect(ItemLanguage language) {
    _title = language.shortTitle;

    _onSelect?.call(language);

    _show();
  }

  void _show() {
    emit(LanguageSelectButtonShow(_title, _selectionDialogCubit));
  }
}
