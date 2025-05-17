import 'package:flutter/material.dart';

import '../../../../../core/uitels/app_images.dart';

class Searchproductsuccesswidget extends StatelessWidget {
  const Searchproductsuccesswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Image.asset(Assets.imagesSearchImage),
          const Text(
            '!لا يوجد نتائج',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
