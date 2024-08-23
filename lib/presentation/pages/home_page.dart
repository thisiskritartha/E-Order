import 'package:e_order/logic/catalogs/catalogs_bloc.dart';
import 'package:e_order/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/catalogs_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sf;

  Future<String?> getName() async {
    sf = await SharedPreferences.getInstance();
    return sf.getString("name");
  }

  Future<void> logOut() async {
    await sf.remove("token");
    await sf.remove("name");
  }

  @override
  Widget build(BuildContext context) {
    getName();
    context.read<CatalogsBloc>().add(CatalogsFetchedEvent());
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<CatalogsBloc>().add(CatalogsFetchedEvent());
            },
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<String?>(
                          future: getName(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return const Center(child: Text('Failed to load name'));
                            } else if (snapshot.hasData) {
                              return Text(
                                "Hello, ${snapshot.data ?? "user"}!",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              );
                            }
                            return const Text("Hello, user");
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            logOut();
                            Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                          },
                          child: Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Let's order your needed item for you.",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Divider(),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Catalogs",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, catalogRoute);
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15.r,
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<CatalogsBloc, CatalogsState>(
                      builder: (context, state) {
                        if (state is CatalogsLoadingState) {
                          return SizedBox(
                            height: 120.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state.catalogs != null) {
                          final catalogs = state.catalogs?.data ?? [];
                          return SizedBox(
                            height: 120.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: catalogs.length,
                              itemBuilder: (context, index) {
                                return buildCatalogsItem(
                                  context,
                                  catalogs[index].imageUrl!,
                                  catalogs[index].name!,
                                  catalogs[index].id!.toString(),
                                );
                              },
                            ),
                          );
                        } else if (state.isFailure!) {
                          return SizedBox(
                            height: 120.h,
                            child: const Center(
                              child: Text('Failed to load catalogs'),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.r,
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    const Center(child: Text("No Products yet.")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
