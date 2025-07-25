import 'package:flutter/material.dart';
import 'DelevaryWidgit.dart';
import 'OrderSammryWidgit.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const Ordersammrywidgit(),
        const SizedBox(
          height: 24,
        ),
        Delevarywidgit(
          pageController: pageController,
        ),
      ],
    );
  }
}
