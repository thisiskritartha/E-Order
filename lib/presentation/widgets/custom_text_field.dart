import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField<T extends Bloc<E, S>, E, S> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon icon;
  final void Function(String) onChange;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, S>(
      builder: (context, state) {
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
            prefixIcon: icon,
            // prefixIcon: const Icon(Icons.person_outline, color: Colors.blueAccent),
            filled: true,
            fillColor: Colors.blueAccent.withOpacity(0.05),
          ),
          cursorColor: Colors.blueAccent,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.blueAccent),
          onChanged: onChange,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $labelText';
            }
            return null;
          },
        );
      },
    );
  }
}
