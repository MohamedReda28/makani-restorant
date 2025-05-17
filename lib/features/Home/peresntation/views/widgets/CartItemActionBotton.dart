import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../domines/entites/CartItemEntity.dart';
import '../../cubits/cartItem/cart_item_cubit.dart';
import 'CustomCartitemactionbotton.dart';

class Cartitemactionbotton extends StatelessWidget {
  const Cartitemactionbotton({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartitemactionbotton(
          icon: Icons.add,
          color: AppColor.kPrimaryColor,
          onpressed: () {
            cartItemEntity.increaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          colorIcon: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${cartItemEntity.quantity}',
            style: AppStyle.bold16,
          ),
        ),
        CustomCartitemactionbotton(
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          onpressed: () {
            cartItemEntity.decreaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          colorIcon: const Color(0xFF969899),
        ),
      ],
    );
  }
}
