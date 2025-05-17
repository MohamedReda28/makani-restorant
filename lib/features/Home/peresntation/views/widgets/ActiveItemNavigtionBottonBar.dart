import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: ShapeDecoration(
                color: AppColor.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              child: Text(name,
                  style: AppStyle.semibold11.copyWith(
                    color: AppColor.kPrimaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
