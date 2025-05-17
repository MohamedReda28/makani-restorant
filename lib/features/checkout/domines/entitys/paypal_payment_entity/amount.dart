

import '../../../../../core/helpes_function/get_currency.dart';
import '../Order_Entity.dart';
import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity( OrderInputEntity entity) {
    return Amount(
      total: entity.CalculatTotalPriceAfterShippingAndDiscounnt().toString(),
      currency: Getcurrency(),
      details: Details.fromEntity(entity),
      );

  }

 toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
