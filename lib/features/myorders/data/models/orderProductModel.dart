
import '../../domins/entitys/orderProductEntity.dart';

class Orderproductmodel {
  final String name;
  final String code;
  final double price;
  final int quantity;
  final String Urlimage;

  Orderproductmodel(
      {required this.name,
      required this.code,
      required this.price,
      required this.quantity,
      required this.Urlimage});

  factory Orderproductmodel.fromJson(Map<String, dynamic> json) {
    return Orderproductmodel(
      name: json['name'],
      code: json['code'],
      price: json['price'],
      quantity: json['quantity'],
      Urlimage: json['Urlimage'],
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'quantity': quantity,
      'Urlimage': Urlimage,
    };
  }
  OrderproductEntity toEntity(){
  return OrderproductEntity(
    name:name,
    code: code,
    price: price,
    quantity : quantity ,
    Urlimage: Urlimage ,
    );
 }
  
}


