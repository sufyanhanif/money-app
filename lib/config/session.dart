import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:money_app/data/model/user.dart';
import 'package:money_app/presentation/controller/c_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = json.encode(mapUser);
    bool success = await pref.setString('user', stringUser);
    if (success) {
      // ignore: non_constant_identifier_names
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
    return success;
  }

  static Future<User> getUser() async {
    User user = User(); //default value
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(CUser());
    cUser.setData(User);
    return user;
  }

  static Future<bool> removeUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(CUser());
    cUser.setData(User());
    return success;
  }
}
