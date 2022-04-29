import 'package:flutter/material.dart';

import 'injaction_contaner.dart';
import 'presentation/navigation/navigation_builder.dart';
import 'presentation/ui/application.dart';
import 'system_chrome_configuration.dart';

void main() async {
  await InjactionContainer().initialize();

  NavigationBuilder().build();

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChromeConfiguration().configure();

  runApp(const Application());
}
