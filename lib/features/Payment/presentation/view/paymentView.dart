import 'package:flutter/material.dart';
import 'package:makani/features/Payment/presentation/view/widgets/PaymentviewBody.dart';

class Paymentview extends StatelessWidget {
  const Paymentview({super.key});
  static const routeName = 'paymentView';
  @override
  Widget build(BuildContext context) {
    return PaymentviewBody();
  }
}
