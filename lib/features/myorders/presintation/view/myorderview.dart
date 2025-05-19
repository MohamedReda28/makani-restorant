import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/helpes_function/getUser.dart';
import 'package:makani/features/myorders/domins/repo/orderRebo.dart';
import 'package:makani/features/myorders/presintation/view/widgets/MyorderviewBody.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/Widghts/customErrorWidght.dart';
import '../../../../core/helpes_function/git_dammy_orders.dart';
import '../../../../core/services/services/git_it_Service.dart';
import '../cubit/cubit/orders_cubit.dart';

class Myorderview extends StatelessWidget {
  const Myorderview({super.key});
  static const routeName = "Myorderview";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrdersCubit(getIt<Ordersrebo>()),
      child: const Scaffold(
        body: SafeArea(child: Myorderviewbody(orders: [],)),
      ),
    );
  }
}

