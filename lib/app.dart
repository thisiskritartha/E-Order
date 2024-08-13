import 'package:e_order/data/repository/catalog_repository.dart';
import 'package:e_order/data/repository/login_repository.dart';
import 'package:e_order/data/repository/product_repository.dart';
import 'package:e_order/logic/Button/button_bloc.dart';
import 'package:e_order/logic/catalogs/catalogs_bloc.dart';
import 'package:e_order/logic/products/products_bloc.dart';
import 'package:e_order/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/login/login_bloc.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;

  const App({super.key, required this.appRouter});

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
                  BlocProvider(create: (context) => CatalogsBloc(catalogRepository: CatalogRepository())),
                  BlocProvider(create: (context) => ProductsBloc(productRepository: ProductRepository())),
                  BlocProvider(create: (context) => ButtonBloc()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "E-Order",
                  initialRoute: authToken == null ? "/" : "/home_page",
                  // initialRoute: "/",
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
