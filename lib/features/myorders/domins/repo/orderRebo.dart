import 'package:dartz/dartz.dart';
import 'package:makani/features/myorders/domins/entitys/order%20entity.dart';
import '../../../../core/erroes/Failur.dart';

abstract class Ordersrebo{

Future<Either<Failur, List<DisplayOrderEntity>>> getOrders(String uID);
}