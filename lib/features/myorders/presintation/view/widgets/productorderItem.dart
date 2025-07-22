import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../domins/entitys/orderProductEntity.dart';

class Productorderitem extends StatelessWidget {
  const Productorderitem({super.key, required this.product});
  final OrderproductEntity product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: CachedNetworkImage(
          imageUrl: product.Urlimage,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      ),
      title: Text(product.name),
      subtitle: Row(
        children: [
          Text('الكميه : ${product.quantity}'),
          const Spacer(),
          Text(
            'جنيه ${(product.price*product.quantity)}'
                ,
            style: const TextStyle(
                color: Colors.green, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class ListProductorderitem extends StatelessWidget {
  const ListProductorderitem({super.key, required this.products});
  final List<OrderproductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: products.length,

      itemBuilder: (context, index) {
        return Productorderitem(
          product: products[index],
        );
      },
    );
  }
}
