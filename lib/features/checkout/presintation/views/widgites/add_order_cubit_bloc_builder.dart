import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Widghts/CustomProgressHUD.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../maneger/addProductCubit/order_cubit.dart';


class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
        builder: (context, state) {
      return CustoProgressHUD(
          isLoading: state is AddOrderLoading, child: child);
    }, listener: (context, state) {
      if (state is AddOrderSuccess) {
        BuildSnakBar(context, 'تم إضافة الطلب بنجاح',type: SnackbarType.success);
      } else if (state is AddOrderFaluir) {
        BuildSnakBar(context, state.messege);
      }
    });
  }
}
