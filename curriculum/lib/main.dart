import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app.dart';
import 'app/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: App()));
  // runZonedGuarded<Future<void>>(
  //   () async {
  //     runApp(ModularApp(module: AppModule(), child: App()));
  //   },
  //   (exception, stackTrace) async {
  //     CrashesService.instance.runZonedOnError(exception, stackTrace);
  //   },
  // );
}
