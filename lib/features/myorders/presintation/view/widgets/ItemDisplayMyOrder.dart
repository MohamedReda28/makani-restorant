import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/features/myorders/presintation/view/widgets/productorderItem.dart';
import '../../../domins/entitys/order entity.dart';

class Itemdisplaymyorder extends StatelessWidget {
  const Itemdisplaymyorder({super.key, required this.orderEntity});
  final DisplayOrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Color(0x60DCDCE8),
        ),
        child: Expanded(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'طلب رقم : ${orderEntity.ordernum}',
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text('${orderEntity.totalPrice} جنية', style: AppStyle.bold13)
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'الحاله',
                        style: AppStyle.regular13
                            .copyWith(color: const Color(0xFF949D9E))),
                    TextSpan(
                        text: ' : ${orderEntity.status}',
                        style: AppStyle.bold13
                            .copyWith(color: const Color(0xFF0C0D0D))),
                  ],
                ),
              ),
              ListProductorderitem(
                products: orderEntity.orderproducts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
