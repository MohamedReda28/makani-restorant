import 'package:flutter/material.dart';
import '../../../../../core/Widghts/CustomFrutDisplay/Custom Fruts Display.dart';
import '../../../../../core/entitys/ProductEntity.dart';
import '../../../../displayaitem/presentarion/view/DispalyIrtem.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayItem(productEntity: products[index]),
                ),
              );            },
            child: CustomFrutDisplay(
              productEntity: products[index],
            ),
          );
        });
  }
}
