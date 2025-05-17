import 'package:flutter/material.dart';
class Searchproductinitialwidget extends StatelessWidget {
  const Searchproductinitialwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text(
            'ابدأ بالبحث عن منتج!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
