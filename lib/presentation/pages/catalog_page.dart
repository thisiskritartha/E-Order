import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_order/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../logic/catalogs/catalogs_bloc.dart';
import '../widgets/custom_text_field.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        margin: EdgeInsets.only(bottom: 16.h),
                      ),
                      CustomTextField<CatalogsBloc, CatalogsEvent, CatalogsState>(
                        labelText: 'Catalog Name',
                        hintText: 'Catalog Name',
                        icon: const Icon(Icons.add_card_outlined, color: Colors.blueAccent),
                        onChange: (value) {
                          // context.read<CatalogsBloc>().add(LoginEmailChanged(value));
                          context.read<CatalogsBloc>().add(CatalogsNameChanged(value));
                        },
                      ),
                      SizedBox(height: 20.0.h),
                      BlocBuilder<CatalogsBloc, CatalogsState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();

                              final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                              if (!context.mounted) return;

                              if (image != null) {
                                context.read<CatalogsBloc>().add(CatalogsPickImageEvent(image));
                              }
                            },
                            child: (state.image == null)
                                ? Container(
                                    height: 200.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                        color: Colors.blue[600]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 60.r,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  )
                                : Image.file(File(state.image!.path)),
                          );
                        },
                      ),
                      SizedBox(height: 20.0.h),
                      SubmitButton(
                        buttonName: "Create Catalog",
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30.r,
        ),
      ),
    );
  }
}
