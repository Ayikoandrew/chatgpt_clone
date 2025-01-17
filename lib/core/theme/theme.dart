import 'package:chatgpt_clone/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _outlineInputBorder({
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27.0),
      focusedBorder: _outlineInputBorder(color: Pallete.gradient2, width: 3),
      enabledBorder: _outlineInputBorder(color: Pallete.borderColor, width: 3),
    ),
  );
}
