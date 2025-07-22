import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makani/core/Widghts/CustomAppbar2.dart';
import 'package:makani/core/helpes_function/getUser.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../constsns.dart';
import '../../cubit/cubit/orders_cubit.dart';
import 'ListviewOrdersBlocBuilder.dart';

class Myorderviewbody extends StatefulWidget {
  const Myorderviewbody({super.key});

  @override
  State<Myorderviewbody> createState() => _MyorderviewbodyState();
}

class _MyorderviewbodyState extends State<Myorderviewbody> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders(getUser()!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomAppbar2(
                  title: 'طلباتي',
                  visableicon: false,
                ),
                SizedBox(
                  height: kTopPadding,
                ),
              ],
            ),
          ),
          ListviewOrdersBlocBuilder(),
        ],
      ),
    );
  }
}
