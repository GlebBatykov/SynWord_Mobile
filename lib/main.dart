import 'package:flutter/material.dart';

import 'injaction_contaner.dart';
import 'presentation/navigation/navigation_builder.dart';
import 'presentation/ui/application.dart';

void main() async {
  await InjactionContainer().initialize();

  NavigationBuilder().build();

  runApp(const Application());
}
