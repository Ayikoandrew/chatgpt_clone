import 'package:chatgpt_clone/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String data;
  const AuthButton({super.key, required this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Pallete.gradient2,
              Pallete.gradient3,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(550, 55),
              backgroundColor: Pallete.transparentColor,
              shadowColor: Pallete.transparentColor,
            ),
            child: Text(
              data,
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
