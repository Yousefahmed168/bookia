import 'package:flutter/material.dart';

import '../functions/validations.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.hintText,
    required this.controller,
  });

  final String? hintText;
  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // labelText: 'Email',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(obscureText ? Icons.visibility_off : Icons.remove_red_eye),
        ),
      ),
      validator: (input) {
        if (isPasswordValid(input!)) {
          return 'Please enter your password';
        } else if (input.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
