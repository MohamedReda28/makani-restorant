import 'package:dartz/dartz.dart';
import '../../../../../../../core/erroes/Failur.dart';
import '../entitys/order entity.dart';

abstract class Ordersrebo{

Future<Either<Failur, List<DisplayOrderEntity>>> getOrders(String uID);
}