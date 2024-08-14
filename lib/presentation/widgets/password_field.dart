import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField<T extends Bloc<E, S>, E, S> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final void Function(String) onChange;
  final void Function() onChangeToggle;
  final bool Function(S) isPasswordVisibleSelector;

  const PasswordField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    required this.onChangeToggle,
    required this.isPasswordVisibleSelector,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, S>(
      builder: (context, state) {
        final isPasswordVisible = isPasswordVisibleSelector(state);
        return TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
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
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.blueAccent,
              ),
              onPressed: onChangeToggle,
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
          obscureText: !isPasswordVisible,
          cursorColor: Colors.blueAccent,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.blueAccent),
          onChanged: onChange,
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
