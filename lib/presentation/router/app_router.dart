import 'package:e_order/presentation/pages/home_page.dart';
import 'package:e_order/presentation/pages/login_screen.dart';
import 'package:e_order/presentation/pages/products_page.dart';
import 'package:e_order/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case "/home_page":
        return MaterialPageRoute(builder: (_) => const HomePage());

      case "/product":
        final catalogId = args?['catalogId'] as String?;
        return MaterialPageRoute(builder: (_) => ProductsPage(catalogId: catalogId!));

      case "/register":
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return null;
    }
  }
}
