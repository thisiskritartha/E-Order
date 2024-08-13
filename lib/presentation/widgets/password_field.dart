import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/login/login_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(color: Colors.blueAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(TogglePasswordVisibility());
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.blueAccent.withOpacity(0.5),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 2.0,
              ),
            ),
            errorStyle: const TextStyle(color: Colors.redAccent),
            prefixIcon: const Icon(Icons.password_outlined, color: Colors.blueAccent),
            filled: true,
            fillColor: Colors.blueAccent.withOpacity(0.05),
          ),
          obscureText: !state.isPasswordVisible,
          cursorColor: Colors.blueAccent,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.blueAccent),
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(value),
              ),
          validator: (value) {
            // const passwordPattern = r'^(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$';
            // final regExp = RegExp(passwordPattern);
            //
            // if (value == null || value.isEmpty) {
            //   return 'Please enter your password';
            // } else if (!regExp.hasMatch(value)) {
            //   return 'Password must be 6+ character with a number & special character';
            // }
            return null;
          },
        );
      },
    );
  }
}
