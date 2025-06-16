


import 'package:hive_flutter/hive_flutter.dart';

import '../../constsns.dart';
import '../../features/auth/domain/entites/UserEntites.dart';


UserEntity? getUser() {
  // var jsonString = SharPref.getString(kUserData);
  // var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  // return userEntity;
  final  userBox = Hive.box<UserEntity>(kUserBox);
  return userBox.get(kUserdoc);
}
