import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_order/presentation/widgets/catalogs_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/catalogs/catalogs_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogs"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BlocBuilder<CatalogsBloc, CatalogsState>(
                builder: (context, state) {
                  if (state is CatalogsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.catalogs != null) {
                    final catalogs = state.catalogs?.data ?? [];
                    return SizedBox(
                      height: 610.h,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: catalogs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/product", arguments: {
                                'catalogId': catalogs[index].id!.toString(),
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 14.0.w),
                              padding: EdgeInsets.symmetric(vertical: 10.0.h),
                              height: 200.0,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0.r),
                                      child: CachedNetworkImage(
                                        imageUrl: catalogs[index].imageUrl!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Image.asset(
                                          'assets/images/random.png',
                                          fit: BoxFit.cover,
                                        ),
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
                                          catalogs[index].name!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state.isFailure!) {
                    return const Center(child: Text('Failed to load catalogs'));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: catalogsFab(context),
    );
  }
}
