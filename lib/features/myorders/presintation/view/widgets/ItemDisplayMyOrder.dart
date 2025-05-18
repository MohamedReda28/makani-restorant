import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';

class Itemdisplaymyorder extends StatelessWidget {
  const Itemdisplaymyorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0x7FF2F3F3),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesBox2),
          SizedBox(width: 12.w,),
          Column(
            children: [
              Text(
                'طلب رقم: 1234567#',
                style:AppStyle.bold13,
              ),
              SizedBox(height: 6.h,),
              Text(
                'تم الطلب :22 مارس ,2024',
                style: AppStyle.regular11.copyWith(color: const Color(0xFF949D9E))
              ),
              SizedBox(height: 6.h,),

               Row(
                children: [
                   Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'عدد الطلبات',
                          style: AppStyle.regular13.copyWith(color:const Color(0xFF949D9E) )
                        ),
                        TextSpan(
                          text: ' : 10 ',
                          style: AppStyle.bold13.copyWith(color: const Color(0xFF0C0D0D))
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 18.w,),
                  const Text(
                    '250 جنية',
                    style: TextStyle(
                      color: Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),


            ],
          )
        ],
      ),
    );
  }
}
