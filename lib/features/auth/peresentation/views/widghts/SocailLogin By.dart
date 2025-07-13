import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/uitels/App_TextStyle.dart';

class CustomLoginBy extends StatelessWidget {
  const CustomLoginBy(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});
  final String title, image;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 343.w,
        height: 56.h,
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
                child: SvgPicture.asset(image)),
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: AppStyle.semibold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
