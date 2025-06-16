import 'package:flutter/material.dart';
import 'package:makani/features/rate/presntation/viwes/widgets/RateViewBody.dart';
class Rateview extends StatelessWidget {
  const Rateview({super.key});
static const routeName = 'Rateview';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RateViewBody()),
    );
  }
}
