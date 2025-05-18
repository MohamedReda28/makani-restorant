import 'package:flutter/material.dart';
import 'package:makani/features/myorders/presintation/view/widgets/MyorderviewBody.dart';

class Myorderview extends StatelessWidget {
  const Myorderview({super.key});
  static const routeName ="Myorderview";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Myorderviewbody()),
    );
  }
}
