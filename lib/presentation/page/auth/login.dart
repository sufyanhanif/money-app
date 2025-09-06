


import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:money_app/config/app_asset.dart';
import 'package:money_app/config/app_color.dart';
import 'package:money_app/data/source/source_user.dart';
import 'package:money_app/presentation/page/auth/widget/auth_button.dart';
import 'package:money_app/presentation/page/auth/widget/auth_field.dart';
import 'package:money_app/presentation/page/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>(); 
  
  login() async{
    if(formKey.currentState!.validate()){
      bool success = await SourceUser.login(emailController.text, passwordController.text);
      if(success){
        // ignore: use_build_context_synchronously
        DInfo.dialogSuccess(context, 'Login Success');
        // ignore: use_build_context_synchronously
        DInfo.closeDialog(
          // ignore: use_build_context_synchronously
          context,
          actionAfterClose: (){
            Get.off(()=> Homepage());
          }
        );
      }else{
         // ignore: use_build_context_synchronously
        DInfo.dialogError(context, 'Login Gagal');
        // ignore: use_build_context_synchronously
        DInfo.closeDialog(context);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          DView.nothing(),
                          Image.asset(
                            AppAsset.logo,
                            height: constraints.maxHeight * 0.3,
                            width: constraints.maxWidth * 0.3,
                          ),
                          DView.height(20),
                          AuthField(controller: emailController, hintText: 'email'),
                          DView.height(8),
                          AuthField(
                            controller: passwordController,
                            hintText: 'password',
                            obscureText: true,
                          ),
                          DView.height(36),
                          AuthButton(name: 'Login', onPressed: login)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: login,
                          child: Text(
                            'Daftar',
                            style: TextStyle(color: AppColor.primary, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
