class AddressOrderentity {
  String? name;
  String? address;
  String? phone;
  String? city;

  AddressOrderentity(
      {this.name,
      this.address,
      this.phone,
      this.city,
      });

  @override
  String toStringg() {
    return '$city , $address';
  }
}
