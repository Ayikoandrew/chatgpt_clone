import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  const CustomPage({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '$hintText can not be empty';
        }
        return null;
      },
    );
  }
}
