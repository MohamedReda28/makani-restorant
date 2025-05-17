import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/uitels/app_images.dart';
import 'FilterBottomSheet.dart';

class ProdutviewResult extends StatelessWidget {
  ProdutviewResult({super.key, required this.productleanth, required this.contextt, });
  final int productleanth;
  final BuildContext contextt;


  int selectedIndex = 0;
  // نقلناه هنا ليكون متغير حالة
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productleanth  نتائج',
          style: AppStyle.bold16.copyWith(
            color: const Color(0xFF0C0D0D),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              builder: (context) =>
                   FilterBottomSheet(contextt: contextt,), // استخدمنا ويدجت مستقل
            );
          },
          child: SvgPicture.asset(Assets.imagesFilrting),
        ),
      ],
    );
  }
}
