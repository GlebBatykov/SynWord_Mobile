import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_dialog_state.dart';

class RegisterDialogCubit extends Cubit<RegisterDialogState> {
  RegisterDialogCubit() : super(RegisterDialogInitial()) {
    _initialize();
  }

  void _initialize() {}
}
