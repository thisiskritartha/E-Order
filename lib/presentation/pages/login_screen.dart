import 'package:e_order/presentation/widgets/email_field.dart';
import 'package:e_order/presentation/widgets/password_field.dart';
import 'package:e_order/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repository/login_repository.dart';
import '../../logic/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Login Success"),
              ));
              // Navigator.pushNamed(context, "/home_page");
              Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "EOrder",
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6.r,
                      ),
                    ),
                    SizedBox(height: 80.h),
                    const EmailField(),
                    SizedBox(height: 12.h),
                    const PasswordField(),
                    SizedBox(height: 30.h),
                    SubmitButton(
                      buttonName: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<LoginBloc>().add(LoginSubmitted());
                        }
                      },
                      // isLoading: true,
                    ),
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
