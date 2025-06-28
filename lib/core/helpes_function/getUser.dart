


import 'package:hive_flutter/hive_flutter.dart';

import '../../constsns.dart';
import '../../features/auth/domain/entites/UserEntites.dart';


UserEntity? getUser() {

  final  userBox = Hive.box<UserEntity>(kUserBox);
  return userBox.get(kUserdoc);
}

Future<void> deleteUser() async {
  final userBox = Hive.box<UserEntity>(kUserBox);
  await userBox.delete(kUserdoc);
}