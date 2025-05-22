import 'package:hive/hive.dart';
part 'UserEntites.g.dart';
@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String uid;

  UserEntity({required this.name, required this.email, required this.uid});
}
