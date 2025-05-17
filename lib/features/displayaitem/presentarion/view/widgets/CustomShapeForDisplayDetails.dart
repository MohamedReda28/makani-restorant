import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/uitels/App_Color.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';

class Customshapefordisplaydetails extends StatelessWidget {
  const Customshapefordisplaydetails({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 8,
        bottom: 12,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFF1F1F5),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                  '${productEntity.numberOfCaloric} كالوري',
                  textAlign: TextAlign.right,
                  style: AppStyle.bold16.copyWith(
                    color: AppColor.kPrimaryColor,
                  )
              ),
            const SizedBox(height: 10,),
              Text(
                '${productEntity.unitAmount} جرام',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF969899),
                  fontSize: 13,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 1.70,
                ),
              )
            ],
          ),
          const Spacer(),
          SvgPicture.asset(Assets.imagesForcalory),

        ],
      ),
    );
  }
}
