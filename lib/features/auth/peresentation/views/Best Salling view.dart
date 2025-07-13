import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/services/git_it_Service.dart';
import 'widghts/BestSallingView_body.dart';

class BestSallingView extends StatelessWidget {
  const BestSallingView({super.key});
  static const String routeName = 'bestSallingView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt<ProductRepo>(),
      ),
      child: const Scaffold(
        body: SafeArea(child: BestsallingviewBody()),
      ),
    );
  }
}
