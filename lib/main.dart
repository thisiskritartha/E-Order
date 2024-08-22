import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_order/data/models/catalog_model.dart';
import 'package:e_order/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(App(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ));
  });
}

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CatalogModelAdapter());
  Hive.registerAdapter(DataAdapter());

  await Hive.openBox("catalog_box");
}
