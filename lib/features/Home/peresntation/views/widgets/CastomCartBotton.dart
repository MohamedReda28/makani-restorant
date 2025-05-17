import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Widghts/Custom_Botton.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../cubits/cart/cart_cubit_cubit.dart';
import '../../cubits/cartItem/cart_item_cubit.dart';
import '../../../../checkout/presintation/views/checkout_view.dart';

class CastomCartBotton extends StatelessWidget {
  const CastomCartBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomBotton(
            title:
                'الدفع  ${context.watch<CartCubit>().cartEntity.CalculteTotlePrice()}جنيه ',
            ontap: () {
              if (context.read<CartCubit>().cartEntity.carsItems.isNotEmpty) {
                Navigator.pushNamed(context, Checkout_View.routeName,
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                BuildSnakBar(context, 'لا يوجد منتجات في السله');
              }
            });
      },
    );
  }
}
