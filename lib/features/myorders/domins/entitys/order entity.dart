

import 'orderProductEntity.dart';

class DisplayOrderEntity {
  final double totalPrice;
  final String uID;
  final String oID;
  final int numoforders;
  final String status;
  final String date;
  final String ordernum;
  final List<OrderproductEntity>orderproducts;


  DisplayOrderEntity({
    required this.orderproducts,
    required this.totalPrice,
    required this.ordernum,
    required this.date,
    required this.uID,
    required this.oID,
    required this.status,
    required this.numoforders,
  });
}