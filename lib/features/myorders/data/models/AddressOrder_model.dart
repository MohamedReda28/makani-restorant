
import '../../domins/entitys/AddressOrder_entity.dart';

class AddressOrderModel {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? city;
  String? addressDetels;

  AddressOrderModel(
      {this.name,
      this.address,
      this.phone,
      this.email,
      this.city,
      this.addressDetels});

  factory AddressOrderModel.fromJson(Map<String, dynamic> json) {
    return AddressOrderModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      addressDetels: json['addressDetels'],
    );
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'city': city,
      'addressDetels': addressDetels,
    };
  }
   AddressOrderEntity toEntity(){
    return AddressOrderEntity(
      name: name,
      address: address,
      phone: phone,
      email: email,
      city: city,
      addressDetels: addressDetels,
      );
    
  }
}
