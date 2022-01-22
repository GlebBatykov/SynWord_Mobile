import 'package:flutter/material.dart';

import 'injaction_contaner.dart';
import 'presentation/ui/application.dart';

void main() async {
  await InjactionContainer().initialize();

  runApp(const Application());
}
