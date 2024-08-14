import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/button/button_bloc.dart';

class SubmitButton extends StatelessWidget {
  final String buttonName;
  final Future<void> Function() onPressed;

  const SubmitButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtonBloc, ButtonState>(
      listener: (context, state) {
        if (state is ButtonLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0.r,
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<ButtonBloc>().add(ButtonPressed(onPressed: onPressed));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0.r),
              ),
              elevation: 5.0,
            ),
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
