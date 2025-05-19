import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/Widghts/customErrorWidght.dart';
import 'package:makani/core/helpes_function/getUser.dart';
import 'package:makani/core/helpes_function/git_dammy_orders.dart';
import 'package:makani/features/myorders/domins/entitys/order%20entity.dart';
import 'package:makani/features/myorders/presintation/cubit/cubit/orders_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../constsns.dart';
import 'ListviewOrders.dart';

class Myorderviewbody extends StatefulWidget {
  const Myorderviewbody({super.key, required this.orders});
  final List<DisplayOrderEntity> orders;

  @override
  State<Myorderviewbody> createState() => _MyorderviewbodyState();
}

class _MyorderviewbodyState extends State<Myorderviewbody> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders(getUser().uid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
            child: Column(
              children: [
                SizedBox(
                  height: kTopPadding.h,
                ),
              ],
            ),
          ),
        ),
        const ListviewOrdersBlocBuilder(),
      ],
    );
  }
}

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
