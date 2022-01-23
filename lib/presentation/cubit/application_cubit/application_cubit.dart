import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/update_screen_cubit/update_screen_cubit.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(ApplicationLoad());

    // Initialize resources

    emit(ApplicationWork());
  }
}
