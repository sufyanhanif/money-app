import 'package:flutter/material.dart';
import 'package:money_app/config/app_color.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const AuthField({super.key, required this.controller, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.transparent),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.primary, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      obscureText: obscureText,
    );
  }
}