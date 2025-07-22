
import '../../../checkout/data/models/orderProductModel.dart';
import '../../domins/entitys/order entity.dart';

class DisplayOrderModel {
  final double totalPrice;
  final String uID;
  final String oID;
  final int numoforders;
  final String status;
  final String date;
  final String ordernum;
  final List<Orderproductmodel> orderProducts;




  DisplayOrderModel({required this.date,
    required this.totalPrice,
    required this.uID,
    required this.oID,
    required this.status,
    required this.orderProducts,
    required this.ordernum,
    required this.numoforders});

  factory DisplayOrderModel.fromJson(Map<String, dynamic> json) {
    return DisplayOrderModel(
      oID: json['oID'],
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      status: json['status'],
      date:json['date'],
      ordernum:json['orderNumber'] ,
      orderProducts: List<Orderproductmodel>.from(
          json['orderProductModel'].map((x) => Orderproductmodel.fromJson(x))),
      numoforders: json['orderProductModel'].length,

    );
  }

  DisplayOrderEntity toEntity(){
    return DisplayOrderEntity(
      oID:  oID,
      totalPrice: totalPrice,
      status: status,
      date: date,
      ordernum: ordernum,
      uID: uID,
      orderproducts:  orderProducts.map((e) => e.toEntity()).toList(),
      numoforders: numoforders,

    );

  }
}