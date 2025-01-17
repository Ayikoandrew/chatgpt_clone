import 'package:chatgpt_clone/core/theme/app_pallete.dart';
import 'package:chatgpt_clone/feature/auth/repositories/auth_remote_repository.dart';
import 'package:chatgpt_clone/feature/auth/view/pages/login_page.dart';
import 'package:chatgpt_clone/feature/auth/view/widgets/auth_button.dart';
import 'package:chatgpt_clone/feature/auth/view/widgets/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class SignupPage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => LoginPage(),
    );
  }

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            await Future.delayed(Duration.zero);
          }
          print(result);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Sign Up.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomPage(
                    controller: nameController,
                    labelText: 'Name',
                    icon: Icon(Icons.person),
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
                  const SizedBox(height: 15),
                  AuthButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final result = await AuthRemoteRepository().signUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          final val = switch (result) {
                            Left(value: final l) => l,
                            Right(value: final r) => r
                          };

                          print(val);
                        }
                      },
                      data: 'Sign Up.'),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
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
                        text: "Already have an acount? ",
                        children: [
                          TextSpan(
                            text: 'Login',
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
      ),
    );
  }
}
