import 'package:d_info/d_info.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_app/config/api.dart';
import 'package:money_app/config/app_request.dart';
import 'package:money_app/config/session.dart';
import 'package:money_app/data/model/user.dart';

class SourceUser {
 

  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });


    if(responseBody == null) return false;
    if(responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }
    return responseBody['success'];

  }


  static Future<bool> register(String name, String email, String password, BuildContext context) async {
    String url = '${Api.user}/register.php';
    Map? responseBody = await AppRequest.post(url, {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toString(),
      'update_at': DateTime.now().toString(),
    });

    if(responseBody == null) return false;
    if(responseBody['success']) {
      // ignore: use_build_context_synchronously
      DInfo.dialogSuccess(context, 'Berhasil daftar');
      // ignore: use_build_context_synchronously
      DInfo.closeDialog(context);
    }else{
      if(responseBody['message'] == email){
        // ignore: use_build_context_synchronously
        DInfo.dialogError(context, 'Email sudah terdaftar');
      }else{
        DInfo.dialogError(context, 'Gagal daftar');
      }
      DInfo.closeDialog(context);
    }
    return responseBody['success'];

  }
}
