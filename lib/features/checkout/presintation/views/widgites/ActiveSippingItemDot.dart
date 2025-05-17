import 'package:flutter/material.dart';
import 'package:makani/core/uitels/App_Color.dart';

class ActiveSippingItemDot extends StatelessWidget {
  const ActiveSippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration:  const ShapeDecoration(
        color: AppColor.kPrimaryColor,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: Colors.white),
        ),
      ),
    );
  }
}
