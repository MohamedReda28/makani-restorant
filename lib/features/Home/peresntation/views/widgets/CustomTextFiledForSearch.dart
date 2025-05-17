import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';

class CustomTextFiledForSearch extends StatelessWidget {
  const CustomTextFiledForSearch({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        height: 45,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ]),
        child: Row(
          children: [
            SvgPicture.asset(Assets.imagesSearch),
            const SizedBox(
              width: 20,
            ),
            Text(
              'ابحث عن.......',
              style: AppStyle.regular13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
