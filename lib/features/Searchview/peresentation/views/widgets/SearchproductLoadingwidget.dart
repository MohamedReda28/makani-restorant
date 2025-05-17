import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpes_function/git_dammy_Product.dart';
import '../../../../Home/peresntation/views/widgets/ProductsGridview.dart';

class Searchproductloadingwidget extends StatelessWidget {
  const Searchproductloadingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: ProductsGridview(
        products: getDomyProducts(),
      ),
    );
  }
}
