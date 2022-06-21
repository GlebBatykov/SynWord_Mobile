import 'package:flutter/material.dart';

import 'data/mapper/mapper_box_configuration.dart';
import 'injaction_contaner.dart';
import 'presentation/navigation/navigation_builder.dart';
import 'presentation/ui/application.dart';
import 'system_chrome_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjactionContainer().initialize();

  MapperBoxConfiguration().configurate();

  NavigationBuilder().build();

  await SystemChromeConfiguration().configure();

  runApp(const Application());
}
