import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/core/uitels/app_images.dart';

import '../../../domins/entitys/order entity.dart';

class Itemdisplaymyorder extends StatelessWidget {
  const Itemdisplaymyorder({super.key, required this.orderEntity});
  final DisplayOrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0x7FF2F3F3),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesBox2),
          SizedBox(
            width: 12.w,
          ),
          Column(
            children: [
              Text(
                'طلب رقم: ${orderEntity.oID}',
                style: AppStyle.bold13,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text('تم الطلب : ${orderEntity.date}',
                  style: AppStyle.regular11
                      .copyWith(color: const Color(0xFF949D9E))),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'عدد الطلبات',
                            style: AppStyle.regular13
                                .copyWith(color: const Color(0xFF949D9E))),
                        TextSpan(
                            text: ' : ${orderEntity.numoforders}',
                            style: AppStyle.bold13
                                .copyWith(color: const Color(0xFF0C0D0D))),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                   Text(
                    '${orderEntity.totalPrice} جنية',
                    style: const TextStyle(
                      color: Color(0xFF0C0D0D) /* Grayscale-950 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    // يمكنك استخدام intl لو أردت ترجمة الشهر بالعربي
    return '${date.day} ${_arabicMonthName(date.month)}, ${date.year}';
  }

  String _arabicMonthName(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر'
    ];
    return months[month - 1];
  }
}
