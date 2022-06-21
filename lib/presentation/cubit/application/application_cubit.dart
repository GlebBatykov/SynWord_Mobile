import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repository/local/user_local_repository.dart';
import '../../../domain/repository/remote/user_remote_repository.dart';
import '../page/update_screen/update_screen_cubit.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial()) {
    _initialize();
  }

  void _initialize() async {
    emit(ApplicationLoad());

    await _registerUser();

    emit(ApplicationWork());
  }

  Future<void> _registerUser() async {
    var userLocalRepository =
        await GetIt.instance.getAsync<UserLocalRepository>();

    var user = userLocalRepository.getUser();

    if (user.id == null) {
      var id = await GetIt.instance<UserRemoteRepository>().registerUser();

      user.id = id;

      userLocalRepository.save();
    }
  }
}
