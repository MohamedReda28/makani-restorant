import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../uitels/App_Color.dart';
import '../uitels/App_TextStyle.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.title, required this.ontap});
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 343.w,
        height: 54.h,
        padding:  EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
        decoration: ShapeDecoration(
          color: AppColor.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: FittedBox(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyle.bold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
