import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/Widghts/custom Url image.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../domines/entites/CartItemEntity.dart';
import '../../cubits/cart/cart_cubit_cubit.dart';
import '../../cubits/cartItem/cart_item_cubit.dart';
import 'CartItemActionBotton.dart';

class CartItim extends StatelessWidget {
  const CartItim({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                      width: screenWidth * 0.18,
                      height: 100,
                      decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                      child: Center(
                        child: CustomNetworkImage(
                          imageUrl: cartItemEntity.productEntity.imageUrl!,
                        ),
                      )),
                  const SizedBox(
                    width: 17,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              cartItemEntity.productEntity.name,
                              style: AppStyle.bold13,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CartCubit>()
                                    .RemoveCardItem(cartItemEntity);
                              },
                              child: SvgPicture.asset(Assets.imagesDeleteIcon),
                            ),
                          ],
                        ),
                        Text(
                          '${cartItemEntity.CalculteTotleWeight()} كم',
                          textAlign: TextAlign.right,
                          style: AppStyle.regular13.copyWith(
                            color: AppColor.lightPrimaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            Cartitemactionbotton(
                              cartItemEntity: cartItemEntity,
                            ),
                            const Spacer(),
                            Text(
                              '${cartItemEntity.CalculteTotlePrice()} جنيه',
                              style: AppStyle.bold19.copyWith(
                                color: AppColor.lightPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
