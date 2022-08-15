import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'data/local/database/objectbox/user_objectbox_repository.dart';
import 'data/remote/http/api/api_check_repository.dart';
import 'data/remote/http/api/api_client_version_repository.dart';
import 'data/remote/http/api/api_coins_repository.dart';
import 'data/remote/http/api/api_email_repository.dart';
import 'data/remote/http/api/api_history_repository.dart';
import 'data/remote/http/api/api_contraints_list_repository.dart';
import 'data/remote/http/api/api_price_list_repository.dart';
import 'data/remote/http/api/api_rephrase_repository.dart';
import 'data/remote/http/api/api_text_from_docx_repository.dart';
import 'data/remote/http/api/setting/api_debug_setting.dart';
import 'data/remote/http/api/setting/api_release_setting.dart';
import 'data/remote/http/api/setting/api_setting.dart';
import 'data/remote/http/api/user_api_repository.dart';
import 'data/remote/platform/google/google_sign_in_repository.dart';
import 'domain/repository/local/user_local_repository.dart';
import 'domain/repository/remote/check_remote_repository.dart';
import 'domain/repository/remote/client_version_remote_repository.dart';
import 'domain/repository/remote/coins_remote_repository.dart';
import 'domain/repository/remote/email_remote_repository.dart';
import 'domain/repository/remote/history_remote_repository.dart';
import 'domain/repository/remote/contraints_list_remote_repository.dart';
import 'domain/repository/remote/price_list_remote_repository.dart';
import 'domain/repository/remote/rephrase_remote_repository.dart';
import 'domain/repository/remote/sing_in_remote_repository.dart';
import 'domain/repository/remote/text_from_docx_remote_repository.dart';
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

    if (kDebugMode) {
      getIt.registerSingleton<ApiSetting>(ApiDebugSetting());
    } else {
      getIt.registerSingleton<ApiSetting>(ApiReleaseSetting());
    }

    getIt.registerSingleton<Store>(await openStore());

    getIt.registerSingletonAsync<UserLocalRepository>(() async {
      var repository = UserObjectboxRepository();

      await repository.load();

      return repository;
    });

    getIt.registerSingleton<UserRemoteRepository>(UserApiRepository());

    getIt.registerSingleton<EmailRemoteRepository>(ApiEmailRepository());

    getIt.registerSingleton<ContraintsListRemoteRepository>(
        ApiContraintsListRepository());

    getIt
        .registerSingleton<PriceListRemoteRepository>(ApiPriceListRepository());

    getIt.registerSingleton<RephraseRemoteRepository>(ApiRephraseRepository());

    getIt.registerSingleton<CheckRemoteRepository>(ApiCheckRepository());

    getIt.registerSingleton<TextFromDocxRemoteRepository>(
        ApiTextFromDocxRepository());

    getIt.registerSingleton<HistoryRemoteRepository>(ApiHistoryRepository());

    getIt.registerSingleton<CoinsRemoteRepository>(ApiCoinsRepository());

    getIt.registerSingleton<ClientVersionRemoteRepository>(
        ApiClientVersionRepository());

    getIt.registerLazySingletonAsync<SignInRemoteRepository>(() async {
      var repository = GoogleSignInRepository();

      await repository.initialize();

      return repository;
    });

    getIt.registerSingleton<ApplicationCubit>(ApplicationCubit());

    getIt.registerLazySingleton<ClipboardCopyUserCase>(
        () => FlutterClipboardCopyUseCase());
    getIt.registerLazySingleton<ClipboardPasteUseCase>(
        () => FlutterClipboardPasteUseCase());
  }
}
