import 'package:flutter/material.dart';

import '../../../../../constsns.dart';
import '../../../domines/entites/CartItemEntity.dart';
import 'CartItem.dart';


class Cartitemlist extends StatelessWidget {
  const Cartitemlist({super.key, required this.cartitems});
  final List<CartItemEntity> cartitems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: cartitems.length,
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: Divider(
              color: Color(0xFFF1F1F5),
              height: 22,
            ),
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
            child: CartItim(
              cartItemEntity: cartitems[index],
            ),
          );
        });
  }
}
