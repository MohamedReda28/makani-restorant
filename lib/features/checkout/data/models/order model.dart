import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../domines/entitys/Order_Entity.dart';
import 'AddressOrder_model.dart';
import 'orderProductModel.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final String oID;
  final AddressOrderModel addressOrderModel;
  final List<Orderproductmodel> orderProductModel;
  final String payMethod;
  final String methodOfReceipt;

  final String? orderNumber;


  OrderModel(
      {required this.totalPrice,
        required this.methodOfReceipt,
      required this.uID,
      required this.oID,
      required this.addressOrderModel,
      required this.orderProductModel,
        this.orderNumber,
      required this.payMethod});

  factory OrderModel.fromOEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      oID: const Uuid().v4(),
      methodOfReceipt:orderEntity.methodOfReceipt!,
      totalPrice: orderEntity.cartList.CalculteTotlePrice(),
      uID: orderEntity.uID,
      orderNumber: null,
      addressOrderModel:
          AddressOrderModel.fromEntity(orderEntity.addressOrderentity),
      payMethod: orderEntity.paywithCash! ? 'كاش' : 'انلاين',
      orderProductModel: orderEntity.cartList.carsItems
          .map((e) => Orderproductmodel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'oID': oID,
      'totalPrice': totalPrice,
      'uID': uID,
      'status': 'قيد الانتظار',
      'orderNumber': orderNumber,
      'date': DateFormat('yyyy-MM-dd HH:mm', 'en_US').format(DateTime.now()),
      'addressOrderModel': addressOrderModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
      'payMethod': payMethod,
      'methodOfReceipt':methodOfReceipt
    };
  }

  OrderModel copyWith({
    double? totalPrice,
    String? uID,
    String? oID,
    AddressOrderModel? addressOrderModel,
    List<Orderproductmodel>? orderProductModel,
    String? payMethod,
    String? methodOfReceipt,
    String? orderNumber,
  }) {
    return OrderModel(
      totalPrice: totalPrice ?? this.totalPrice,
      uID: uID ?? this.uID,
      oID: oID ?? this.oID,
      addressOrderModel: addressOrderModel ?? this.addressOrderModel,
      orderProductModel: orderProductModel ?? this.orderProductModel,
      payMethod: payMethod ?? this.payMethod,
      methodOfReceipt: methodOfReceipt??this.methodOfReceipt,
      orderNumber: orderNumber ?? this.orderNumber,
    );
  }

}
