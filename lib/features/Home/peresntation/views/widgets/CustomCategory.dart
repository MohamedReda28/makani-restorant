import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';

import '../../../domines/entites/CatogryEntity.dart';

class Customcategory extends StatelessWidget {
  const Customcategory({
    super.key,
    required this.categortEntity, required this.onTap,
  });
  final CategortEntity categortEntity;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
              ),
              child: Image.asset(
                categortEntity.image,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              categortEntity.title,
              textAlign: TextAlign.right,
              style: AppStyle.semibold13,
            )
          ],
        ),
      ),
    );
  }
}
