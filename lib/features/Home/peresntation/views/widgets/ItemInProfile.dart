import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';
import 'package:makani/features/Home/data/Models/ItemProfileModel.dart';

class Iteminprofile extends StatelessWidget {
  const Iteminprofile({super.key, required this.itemProfileModel});
 final ItemProfileModel itemProfileModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:itemProfileModel.onTap,
      child: Row(
        children: [
          SvgPicture.asset(itemProfileModel.icon),
          SizedBox(width: 4.w,),
          Text(
            itemProfileModel.tittle,
            style: AppStyle.semibold13.copyWith(color: const Color(0xFF949D9E)),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.imagesArowgo),


        ],
      ),
    );
  }
}
