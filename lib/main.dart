import 'package:chatgpt_clone/core/theme/theme.dart';
import 'package:chatgpt_clone/feature/auth/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chatgpt clone',
      theme: AppTheme.darkTheme,
      home: const SignupPage(),
    );
  }
}
