import 'dart:convert';

import '../../constsns.dart';
import '../../features/auth/data/Models/UserModel.dart';
import '../../features/auth/domain/entites/User entites.dart';
import '../services/services/shardpreferance_Singlton.dart';


UserEntity getUser() {
  var jsonString = SharPref.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
