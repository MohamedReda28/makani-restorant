import 'package:flutter/material.dart';
import '../../../../../core/uitels/App_Color.dart';
import 'WhoOurBody.dart';

class WhoOur extends StatelessWidget {
  const WhoOur({super.key});
  static const routeName = 'WhoOurView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('من نحن'),
        centerTitle: true,
        backgroundColor: AppColor.kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: const WhoOurBody(),
    );
  }
}
