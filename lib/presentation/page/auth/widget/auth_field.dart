import 'package:flutter/material.dart';
import 'package:money_app/config/app_color.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const AuthField({super.key, required this.controller, required this.hintText, this.obscureText = false});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool hasText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value!.isEmpty ? 'Enter ${widget.hintText}' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: AppColor.primary.withValues(alpha: 128),
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

        
      obscureText: widget.obscureText,
    );
  }
}