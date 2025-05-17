import 'package:flutter/material.dart';

import '../../../../../core/uitels/App_TextStyle.dart';

class CustomDriverAndOr extends StatelessWidget {
  const CustomDriverAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: Color(0xFFDCDEDE),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'أو',
            style: AppStyle.semibold16,
          ),
        ),
        const Expanded(
            child: Divider(
          color: Color(0xFFDCDEDE),
        )),
      ],
    );
  }
}
