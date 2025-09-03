
import 'package:get/state_manager.dart';
import 'package:money_app/data/model/user.dart';

class CUser extends GetxController{
  final _data = User().obs;
  User get data => _data.value;
  setData(n) => _data.value = n;
}