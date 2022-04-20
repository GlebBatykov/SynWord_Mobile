import 'package:get_it/get_it.dart';

import 'presentation/cubit/application_cubit/application_cubit.dart';

class InjactionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerSingleton(ApplicationCubit());
  }
}
