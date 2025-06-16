
import 'package:dartz/dartz.dart';

import '../../erroes/Failur.dart';

abstract class LogoutRepo {
  Future<Either<Failur, void>> lougoutUser();
}
