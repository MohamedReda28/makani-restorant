import 'package:flutter/material.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import 'ActiveSippingItemDot.dart';
import 'InActiveSippingItemDot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isselected,
    required this.ontap,
    this.enabled = true, // <-- إضافة المتغير
  });

  final String title, subtitle, price;
  final bool isselected;
  final bool enabled; // <-- جديد
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? ontap : null, // <-- مش هيشتغل لو disabled
      child: IntrinsicHeight(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(
            top: 16,
            left: 13,
            right: 28,
            bottom: 16,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isselected
                    ? AppColor.kPrimaryColor
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isselected
                  ? const ActiveSippingItemDot()
                  : const InActiveSippingItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppStyle.semibold13.copyWith(
                          color: enabled ? Colors.black : Colors.grey, // تغيير اللون
                        ),
                      ),
                      if (!enabled) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'قريبًا',
                            style: TextStyle(
                                color: Colors.orange, fontSize: 12),
                          ),
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: AppStyle.regular13.copyWith(
                      color: enabled
                          ? Colors.black.withOpacity(0.5)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppStyle.bold13.copyWith(
                    color:
                    enabled ? AppColor.kPrimaryColor : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
