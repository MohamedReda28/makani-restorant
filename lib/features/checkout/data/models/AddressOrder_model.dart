


import '../../domines/entitys/Address_OrderEntity.dart';

class AddressOrderModel {
  String? name;
  String? phone;
  String? address;
  String? city;

  AddressOrderModel(
      {this.name,
      this.address,
      this.phone,
      this.city,
      });

  factory AddressOrderModel.fromEntity(AddressOrderentity addressOrderentity) {
    return AddressOrderModel(
      name: addressOrderentity.name,
      address: addressOrderentity.address,
      phone: addressOrderentity.phone,
      city: addressOrderentity.city,
    );
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'city': city,
    };
  }
}
