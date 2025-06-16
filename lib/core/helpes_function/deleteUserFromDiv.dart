import 'package:hive/hive.dart';
import 'package:makani/constsns.dart';

import '../../features/auth/domain/entites/UserEntites.dart';

Future<void> deleteUser() async{
  await Hive.box<UserEntity>(kUserBox).delete(kUserdoc);
}
