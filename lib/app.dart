import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_order/data/repository/catalog_repository.dart';
import 'package:e_order/data/repository/login_repository.dart';
import 'package:e_order/data/repository/product_repository.dart';
import 'package:e_order/data/repository/register_repository.dart';
import 'package:e_order/logic/catalogs/catalogs_bloc.dart';
import 'package:e_order/logic/products/products_bloc.dart';
import 'package:e_order/logic/register/register_bloc.dart';
import 'package:e_order/presentation/router/app_router.dart';
import 'package:e_order/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/button/button_bloc.dart';
import 'logic/login/login_bloc.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const App({super.key, required this.appRouter, required this.connectivity});

  Future<String?> getToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("token");
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return FutureBuilder<String?>(
          future: getToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              String? authToken = snapshot.data;

              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => LoginBloc(loginRepository: LoginRepository())),
                  BlocProvider(create: (context) => RegisterBloc(registerRepository: RegisterRepository())),
                  BlocProvider(create: (context) => CatalogsBloc(catalogRepository: CatalogRepository())),
                  BlocProvider(create: (context) => ProductsBloc(productRepository: ProductRepository())),
                  BlocProvider(create: (context) => ButtonBloc()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "E-Order",
                  initialRoute: authToken == null ? loginRoute : homeRoute,
                  //initialRoute: catalogRoute,
                  onGenerateRoute: appRouter.onGenerateRoute,
                ),
              );
            }
          },
        );
      },
    );
  }
}
