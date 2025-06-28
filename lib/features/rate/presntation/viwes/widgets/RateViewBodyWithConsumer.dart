import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Widghts/CustomProgressHUD.dart';
import '../../../../../core/entitys/ProductEntity.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../manager/cubit/review_cubit.dart';
import 'RateViewBody.dart';

class RateViewBodyWithConsumer extends StatelessWidget {
  const RateViewBodyWithConsumer({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit,ReviewState>(
        builder:(context,state)=>CustoProgressHUD(
          isLoading: state is ReviewLoading,
          child: RateViewBody(productEntity: productEntity,),

        ) ,
        listener: (context,state) {
          if(state is ReviewSuccesss){
            BuildSnakBar(context, 'تم اضافه تعليق');
          }
          if(state is ReviewFaluir){
            BuildSnakBar(context, state.erorrMassege);
          }
        }
    );
  }
}
