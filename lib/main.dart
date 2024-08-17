import 'package:e_order/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(App(
      appRouter: AppRouter(),
    ));
  });
  // runApp(App(
  //   appRouter: AppRouter(),
  // ));
}
