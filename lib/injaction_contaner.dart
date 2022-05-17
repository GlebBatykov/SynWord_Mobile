import 'package:get_it/get_it.dart';

import 'domain/use_case/clipboard_copy/clipboard_copy_use_case.dart';
import 'domain/use_case/clipboard_copy/flutter_clipboard_copy_use_case.dart';
import 'domain/use_case/clipboard_paste/clipboard_paste_use_case.dart';
import 'domain/use_case/clipboard_paste/flutter_clipboard_paste_use_case.dart';
import 'presentation/cubit/application/application_cubit.dart';

class InjactionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerSingleton<ApplicationCubit>(ApplicationCubit());

    getIt.registerLazySingleton<ClipboardCopyUserCase>(
        () => FlutterClipboardCopyUseCase());
    getIt.registerLazySingleton<ClipboardPasteUseCase>(
        () => FlutterClipboardPasteUseCase());
  }
}
