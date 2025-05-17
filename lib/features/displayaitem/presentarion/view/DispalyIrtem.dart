import 'package:flutter/material.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/features/displayaitem/presentarion/view/widgets/DispalyirtemBody.dart';

class DisplayItem extends StatelessWidget {
   DisplayItem({super.key,required this.productEntity });
static const routeName ="DisplayItemView";
 final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:DisplayItemBody(productEntity: productEntity,),
    );
  }
}
