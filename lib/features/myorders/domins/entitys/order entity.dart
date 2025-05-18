import 'AddressOrder_entity.dart';
import 'orderProductEntity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final String oID;
  final AddressOrderEntity addressOrderEntity;
  final List<OrderproductEntity> orderProductEntity;
  final String payMethod;
  final String status;

  OrderEntity(
      {required this.totalPrice,
      required this.uID,
      required this.oID,
      required this.addressOrderEntity,
      required this.orderProductEntity,
      required this.status,
      required this.payMethod,});


}
