import '../../../Home/domines/entites/CardEntity.dart';
import 'Address_OrderEntity.dart';

class OrderInputEntity {
  final CartEntity cartList;
  final String uID;
  bool? paywithCash;
  String? methodOfReceipt;
  AddressOrderentity addressOrderentity = AddressOrderentity();

  OrderInputEntity({
    required this.cartList,
    this.methodOfReceipt,
    this.paywithCash,
    required this.uID,
  });

  double CalculatShippingCost() {
    if (paywithCash!) {
      return 30.0;
    } else {
      return 0.0;
    }
  }

  double CalculatShippingDiscounnt() {
    return 0;
  }

  double CalculatTotalPriceAfterShippingAndDiscounnt() {
    return cartList.CalculteTotlePrice() +
        CalculatShippingCost() -
        CalculatShippingDiscounnt();
  }
}
