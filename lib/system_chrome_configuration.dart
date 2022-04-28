import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemChromeConfiguration {
  void configure() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
