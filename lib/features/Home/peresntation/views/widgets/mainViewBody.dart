import 'package:flutter/material.dart';

import '../CartView.dart';
import '../HomeView.dart';
import '../produt_View.dart';
import '../profileView.dart';


class MainviewBody extends StatelessWidget {
  const MainviewBody({super.key, required this.currintindex});
  final int currintindex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currintindex,
      children: const [
        Homeview(),
        ProdutsView(),
        CartViews(),
        Profileview(),
      ],
    );
  }
}
