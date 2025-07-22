import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/helpes_function/git_dammy_orders.dart';
import '../../cubit/cubit/orders_cubit.dart';
import 'ListviewOrders.dart';

class ListviewOrdersBlocBuilder extends StatelessWidget {
  const ListviewOrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      if (state is OrdersSuccess) {
        return ListviewOrders(orders: state.orders);
      } else if (state is OrdersFailure) {
        return Customerrorwidght(text: state.message);
      } else {
        return Skeletonizer.sliver(
          child: ListviewOrders(orders: getdammyOrders()),
        );
      }
    });
  }
}
