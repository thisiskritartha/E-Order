import 'dart:io';

import 'package:e_order/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../logic/catalogs/catalogs_bloc.dart';
import 'custom_text_field.dart';

FloatingActionButton catalogsFab(BuildContext context) {
  return FloatingActionButton(
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
  );
}
