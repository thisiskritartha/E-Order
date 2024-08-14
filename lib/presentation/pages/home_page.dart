import 'package:e_order/logic/catalogs/catalogs_bloc.dart';
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
              physics: const BouncingScrollPhysics(),
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
                                  fontWeight: FontWeight.w500,
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
                            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
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
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.r,
                        ),
                      ],
                    ),
                    BlocBuilder<CatalogsBloc, CatalogsState>(
                      builder: (context, state) {
                        if (state is CatalogsLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is CatalogsFetchedState) {
                          final catalogs = state.catalogs.data ?? [];
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
                        } else if (state is CatalogsError) {
                          return const Center(child: Text('Failed to load catalogs'));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Orders",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.r,
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    // const Center(child: Text("No Order yet.")),

                    // [IN ORDER TO USE REFRESH INDICATOR]//
                    SizedBox(
                      height: 600,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 14.0.w),
                              padding: EdgeInsets.symmetric(vertical: 10.0.h),
                              width: 130.0,
                              height: 130.0,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0.r),
                                      child: Image.asset(
                                        "assets/images/random.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0.r),
                                          bottomRight: Radius.circular(12.0.r),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Test ${index + 1}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
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
