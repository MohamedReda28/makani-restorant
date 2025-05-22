import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../features/checkout/data/models/order model.dart';
import '../../../features/checkout/domines/entitys/Order_Entity.dart';
import '../../erroes/Failur.dart';
import '../../services/services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';
import 'order_reop.dart';

class OrederRepoImpl implements OrderRepo {
  final DataBaseServeces dataBaseServeces;
  OrederRepoImpl({required this.dataBaseServeces});
  @override
  Future<Either<Failur, void>> addOrder(OrderInputEntity orderEntity) async {
    try {

      final nextOrderNumber = await _getNextOrderNumber();
      final orderNumber = 'ORD-${nextOrderNumber.toString().padLeft(5, '0')}';
      var order = OrderModel.fromOEntity(orderEntity).copyWith(
        orderNumber: orderNumber,
      );
      await dataBaseServeces.addData(
          path: BackEndImpoint.addOrders,
          documentId:order.oID ,
          data: order.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  //دي عشان اعمل رقم الطلب
  Future<int> _getNextOrderNumber() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return await firestore.runTransaction<int>((transaction) async {
      final counterRef = firestore.collection('counters').doc('ordersCounter');
      final snapshot = await transaction.get(counterRef);

      int current = snapshot['lastOrderNumber'] ?? 0;
      int next = current + 1;

      transaction.update(counterRef, {'lastOrderNumber': next});
      return next;
    });
  }

}
