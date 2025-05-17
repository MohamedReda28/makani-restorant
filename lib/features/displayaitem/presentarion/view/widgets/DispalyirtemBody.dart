import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/Widghts/Custom_Botton.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/services/services/CustomBlocObserver.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';
import 'package:makani/features/Home/peresntation/cubits/cart/cart_cubit_cubit.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomFrutDisplay/RichTextforSubtitle.dart';
import '../../../../../core/Widghts/custom Url image.dart';
import 'CustomShapeForDisplayDetails.dart';

class DisplayItemBody extends StatelessWidget {
  const DisplayItemBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.imagesShapeindisplay,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: 30,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.imagesArrowBack))),
            Positioned(
              top: 50,
              bottom: 50,
              right: 50,
              left: 50,
              child: CustomNetworkImage(
                imageUrl: productEntity.imageUrl!,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.name,
                textAlign: TextAlign.right,
                style: AppStyle.bold16,
              ),
              const SizedBox(
                height: 12,
              ),
              RichTextforSubtitle(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                productEntity.description,
                style:
                    AppStyle.regular13.copyWith(color: const Color(0xFF969899)),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customshapefordisplaydetails(
                    productEntity: productEntity,
                  ),
                ],
              ),
              Center(
                child: CustomBotton(title: 'اضف الي السله', ontap: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
