import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/Home/peresntation/cubits/post/post_cubit.dart';
import 'package:makani/features/Home/peresntation/views/widgets/homeViewBody.dart';

import '../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/services/git_it_Service.dart';
import '../../domines/repo/PostRepo.dart';


class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(  create: (context) => ProductCubit(
        getIt<ProductRepo>())),


        BlocProvider(  create: (context) => PostCubit(
            getIt<PostRepo>())),

       ],
      child: const HomeViewBody());
  }
}
