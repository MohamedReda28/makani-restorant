import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';
import 'package:makani/core/services/services/git_it_Service.dart';
import 'package:makani/features/Searchview/peresentation/views/maneger/cubit/search_product_cubit.dart';
import 'package:makani/features/Searchview/peresentation/views/widgets/SearchviewBody.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});
  static const routeName = 'Searchview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchProductCubit(getIt<ProductRepo>()),
      child: const Scaffold(
        body: SafeArea(
          child: SearchviewBody(),
        ),
      ),
    );
  }
}



