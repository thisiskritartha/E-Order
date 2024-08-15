import 'package:e_order/presentation/widgets/custom_text_field.dart';
import 'package:e_order/presentation/widgets/password_field.dart';
import 'package:e_order/presentation/widgets/submit_button.dart';
import 'package:e_order/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repository/register_repository.dart';
import '../../logic/register/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RegisterRepository(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Register Success"),
              ));
              Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
            } else if (state.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Registration Failed."),
              ));
              Navigator.pushNamedAndRemoveUntil(context, registerRoute, (route) => false);
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Register to EOrder",
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.6.r,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Full Name',
                        hintText: '',
                        icon: const Icon(Icons.person_outline, color: Colors.blueAccent),
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterNameChanged(value));
                        },
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Email',
                        hintText: 'example@domain.com',
                        icon: const Icon(Icons.email_outlined, color: Colors.blueAccent),
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterEmailChanged(value));
                        },
                      ),
                      SizedBox(height: 12.h),
                      PasswordField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Password',
                        hintText: 'Password',
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterPasswordChanged(value));
                        },
                        onChangeToggle: () {
                          context.read<RegisterBloc>().add(TogglePasswordVisibility());
                        },
                        isPasswordVisibleSelector: (state) => state.isPasswordVisible,
                      ),
                      SizedBox(height: 12.h),
                      PasswordField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterConfirmPasswordChanged(value));
                        },
                        onChangeToggle: () {
                          context.read<RegisterBloc>().add(ToggleConfirmPasswordVisibility());
                        },
                        isPasswordVisibleSelector: (state) => state.isConfirmPasswordVisible,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Phone',
                        hintText: 'Phone number',
                        icon: const Icon(Icons.phone, color: Colors.blueAccent),
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterPhoneChanged(value));
                        },
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'Country',
                        hintText: 'Country',
                        icon: const Icon(Icons.south_america, color: Colors.blueAccent),
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterCountryChanged(value));
                        },
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField<RegisterBloc, RegisterEvent, RegisterState>(
                        labelText: 'City',
                        hintText: 'City',
                        icon: const Icon(Icons.house, color: Colors.blueAccent),
                        onChange: (value) {
                          context.read<RegisterBloc>().add(RegisterCityChanged(value));
                        },
                      ),
                      SizedBox(height: 30.h),
                      SubmitButton(
                        buttonName: 'Register',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<RegisterBloc>().add(RegisterSubmitted());
                          }
                        },
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          SizedBox(width: 2.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, loginRoute);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
