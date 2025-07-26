import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';
import 'package:makani/core/services/services/git_it_Service.dart';
import 'package:makani/features/rate/presntation/manager/cubit/addReview/review_cubit.dart';
import 'package:makani/features/rate/presntation/viwes/widgets/RateViewBodyWithConsumer.dart';


class Rateview extends StatelessWidget {
  const Rateview({
    super.key,
    required this.productEntity,
  });
  static const routeName = 'Rateview';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewCubit(getIt<ProductRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: RateViewBodyWithConsumer(
            productEntity: productEntity,
          ),
        ),
      ),
    );
  }
}
