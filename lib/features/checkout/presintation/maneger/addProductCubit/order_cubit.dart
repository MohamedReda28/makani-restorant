import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/repos/order_repo/order_reop.dart';
import '../../../domines/entitys/Order_Entity.dart';
part 'order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orederRepo) : super(AddOrderInitial());
  final OrderRepo orederRepo;

  Future<void> addOrder(OrderInputEntity orderEntity) async {
    emit(AddOrderLoading());
    var result = await orederRepo.addOrder(orderEntity);
    result.fold(
      (faluir) => emit(AddOrderFaluir(faluir.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
