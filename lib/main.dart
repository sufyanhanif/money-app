import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_app/config/app_color.dart';
import 'package:money_app/config/session.dart';
import 'package:money_app/data/model/user.dart';
import 'package:money_app/presentation/page/auth/login.dart';
import 'package:money_app/presentation/page/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
        ),
      ),
      home: FutureBuilder(future: Session.getUser(), builder: (context,AsyncSnapshot<User> snapshot) {
        if (snapshot.data != null && snapshot.data!.idUser != null) {
          return const Homepage();
        } else {
          return const LoginPage();
        }
        
      })
    );
  }
}

