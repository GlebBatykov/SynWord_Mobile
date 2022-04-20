import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/navigation/navigation_builder.dart';

import 'injaction_contaner.dart';
import 'presentation/ui/application.dart';

void main() async {
  await InjactionContainer().initialize();

  NavigationBuilder().build();

  runApp(const Application());
}
