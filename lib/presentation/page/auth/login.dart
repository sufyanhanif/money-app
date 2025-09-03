import 'dart:math';

import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_app/config/app_asset.dart';
import 'package:money_app/config/app_color.dart';
import 'package:money_app/presentation/page/auth/widget/auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Image.asset(
                      AppAsset.logo,
                      height: constraints.maxHeight * 0.3,
                      width: constraints.maxWidth * 0.3,
                    ),
                    DView.height(20),
                    AuthField(controller: emailController, hintText: 'email'),
                    DView.height(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Daftar',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
