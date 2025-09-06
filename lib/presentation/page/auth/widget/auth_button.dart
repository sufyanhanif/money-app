import 'package:flutter/material.dart';
import 'package:money_app/config/app_color.dart';

class AuthButton extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.name, required this.onPressed});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}