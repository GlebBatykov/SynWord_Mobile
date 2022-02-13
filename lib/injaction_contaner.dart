import 'package:get_it/get_it.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword_flutter_cubit_application/presentation/navigation/navigation_builder.dart';

import 'presentation/cubit/application_cubit/application_cubit.dart';

class InjactionContainer {
  Future<void> initialize() async {
    var getIt = GetIt.instance;

    getIt.registerLazySingleton<Poseidon>(() => NavigationBuilder().build());

    getIt.registerSingleton(ApplicationCubit());
  }
}
