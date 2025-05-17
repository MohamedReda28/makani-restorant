import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../domines/entitys/Order_Entity.dart';
import 'Payment_Item.dart';

class Delevarywidgit extends StatelessWidget {
  const Delevarywidgit({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(
            width: 8,
          ),
          Text(context.read<OrderInputEntity>().addressOrderentity.toStringg(),
              style: AppStyle.regular16.copyWith(
                color: const Color(0xFF4E5556),
              )),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Text('تعديل',
                    style: AppStyle.semibold13.copyWith(
                      color: const Color(0xFF949D9E),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
