import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/Home/peresntation/views/widgets/ProdutViewBody.dart';
import '../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/services/git_it_Service.dart';

class ProdutsView extends StatelessWidget {
  const ProdutsView({super.key});
  static const routeName = 'ProdutsView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit(
              getIt<ProductRepo>(),
            ),
        child: const ProdutViewBody());
  }
}
