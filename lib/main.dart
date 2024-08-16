import 'package:e_order/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    appRouter: AppRouter(),
  ));
}
