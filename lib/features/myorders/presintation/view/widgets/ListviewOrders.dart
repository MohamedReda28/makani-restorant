import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domins/entitys/order entity.dart';
import 'ItemDisplayMyOrder.dart';

class ListviewOrders extends StatelessWidget {
  const ListviewOrders({super.key, required this.orders});
  final List<DisplayOrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount:orders.length ,
        itemBuilder: (context, index) => Itemdisplaymyorder(
          orderEntity: orders[index],
        ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h));
  }
}