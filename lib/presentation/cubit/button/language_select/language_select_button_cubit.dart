import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_select_button_state.dart';

class LanguageSelectButtonCubit extends Cubit<LanguageSelectButtonState> {
  LanguageSelectButtonCubit() : super(LanguageSelectButtonInitial());
}
