
import '../../domins/entitys/order entity.dart';

class DisplayOrderModel {
  final double totalPrice;
  final String uID;
  final String oID;
  final int numoforders;
  final String status;
  final String date;


  DisplayOrderModel({required this.date,
      required this.totalPrice,
      required this.uID,
      required this.oID,
      required this.status,
      required this.numoforders});

  factory DisplayOrderModel.fromJson(Map<String, dynamic> json) {
    return DisplayOrderModel(
      oID: json['oID'],
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      status:  json['status'],
      date:json['date'],
       numoforders: json ['orderProductModel'][0]['quantity'],
    );
  }

  DisplayOrderEntity toEntity(){
    return DisplayOrderEntity(
      oID:  oID,
      totalPrice: totalPrice,
      status: status,
      date: date,
      uID: uID,
      numoforders: numoforders,
      );
     
  }
}
