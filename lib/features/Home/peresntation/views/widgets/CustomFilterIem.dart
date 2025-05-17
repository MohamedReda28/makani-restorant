import 'package:flutter/material.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../checkout/presintation/views/widgites/ActiveSippingItemDot.dart';
import '../../../../checkout/presintation/views/widgites/InActiveSippingItemDot.dart';

class Customfilteriem extends StatelessWidget {
  const Customfilteriem({
    super.key,
    required this.title,
    required this.isselected,
    required this.ontap,
  });
  final String title;
  final bool isselected;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isselected
              ? const ActiveSippingItemDot()
              : const InActiveSippingItemDot(),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppStyle.semibold13,
          ),
        ],
      ),
    );
  }
}
