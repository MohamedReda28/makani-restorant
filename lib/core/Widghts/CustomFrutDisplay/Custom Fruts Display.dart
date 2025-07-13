import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/uitels/App_Color.dart';
import '../../../features/Home/peresntation/cubits/cart/cart_cubit_cubit.dart';
import '../../entitys/ProductEntity.dart';
import '../../uitels/App_TextStyle.dart';
import '../custom Url image.dart';
import 'RichTextforSubtitle.dart';

class CustomFrutDisplay extends StatelessWidget {
  const CustomFrutDisplay({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final isDesktop = constraints.maxWidth >= 1000;

        return Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F5F7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Stack(
            children: [
              // Positioned(
              //   top: -3,
              //   right: -3,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.favorite_border_outlined),
              //   ),
              // ),
              Column(
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 2,
                    child: CustomNetworkImage(
                      imageUrl: productEntity.imageUrl!,
                    ),
                  ),
                  //const SizedBox(height: 8),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            productEntity.name,
                            maxLines: 1,
                            style: AppStyle.semibold13.copyWith(
                              fontSize: isDesktop ? 20 : isTablet ? 16 : 13,
                              color: const Color(0xFF0C0D0D),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: RichTextforSubtitle(
                                    productEntity: productEntity),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<CartCubit>().AddProduct(
                                        productEntity);
                                  },
                                  child:const CircleAvatar(
                                      minRadius: 13,
                                      maxRadius: 17,
                                      backgroundColor: AppColor.kPrimaryColor,
                                      child: Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
