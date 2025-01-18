import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final TextEditingController? controller;

  final bool obscureText;
  final String? labelText;
  final Widget icon;
  const CustomPage({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '$labelText can not be empty';
        }
        return null;
      },
    );
  }
}
