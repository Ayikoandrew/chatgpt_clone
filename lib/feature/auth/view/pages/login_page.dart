import 'package:chatgpt_clone/feature/auth/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => const SignupPage(),
    );
  }

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
