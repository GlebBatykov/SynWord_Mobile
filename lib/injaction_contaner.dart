import 'package:get_it/get_it.dart';

import 'presentation/cubit/application/application_cubit.dart';
import 'presentation/cubit/body/body_cubit.dart';

class InjactionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerSingleton<ApplicationCubit>(ApplicationCubit());

    getIt.registerLazySingleton<BodyCubit>(() => BodyCubit());
  }
}
