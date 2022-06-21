import 'package:get_it/get_it.dart';

import 'data/local/database/objectbox/user_objectbox_repository.dart';
import 'data/remote/http/api/user_api_repository.dart';
import 'domain/repository/local/user_local_repository.dart';
import 'domain/repository/remote/user_remote_repository.dart';
import 'domain/use_case/clipboard_copy/clipboard_copy_use_case.dart';
import 'domain/use_case/clipboard_copy/flutter_clipboard_copy_use_case.dart';
import 'domain/use_case/clipboard_paste/clipboard_paste_use_case.dart';
import 'domain/use_case/clipboard_paste/flutter_clipboard_paste_use_case.dart';
import 'objectbox.g.dart';
import 'presentation/cubit/application/application_cubit.dart';

class InjactionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerSingleton<Store>(await openStore());

    getIt.registerSingletonAsync<UserLocalRepository>(() async {
      var repository = UserObjectboxRepository();

      await repository.load();

      return repository;
    });

    getIt.registerSingleton<UserRemoteRepository>(UserApiRepository());

    getIt.registerSingleton<ApplicationCubit>(ApplicationCubit());

    getIt.registerLazySingleton<ClipboardCopyUserCase>(
        () => FlutterClipboardCopyUseCase());
    getIt.registerLazySingleton<ClipboardPasteUseCase>(
        () => FlutterClipboardPasteUseCase());
  }
}
