import 'package:chatgpt_clone/core/theme/app_pallete.dart';
import 'package:chatgpt_clone/feature/auth/repositories/auth_remote_repository.dart';
import 'package:chatgpt_clone/feature/auth/view/pages/signup_page.dart';
import 'package:chatgpt_clone/feature/auth/view/widgets/auth_button.dart';
import 'package:chatgpt_clone/feature/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomPage(
                  controller: emailController,
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                const SizedBox(height: 20),
                CustomPage(
                  controller: passwordController,
                  obscureText: true,
                  labelText: 'Password',
                  icon: Icon(Icons.password),
                ),
                const SizedBox(height: 20),
                AuthButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final res = await AuthRemoteRepository().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        final val = switch (res) {
                          Left(value: final l) => l,
                          Right(value: final r) => r
                        };

                        print(val);
                      }
                    },
                    data: 'Login'),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () {
                      //     print("sign up recognized pressed");
                      //     Navigator.push(
                      //       context,
                      //       LoginPage.route(),
                      //     );
                      //   },
                      text: "Don't have an acount? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up.',
                          style: TextStyle(
                            color: Pallete.gradient2,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
