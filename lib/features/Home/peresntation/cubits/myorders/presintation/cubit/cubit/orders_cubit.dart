import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makani/features/Home/peresntation/cubits/myorders/domins/repo/orderRebo.dart';
import '../../../domins/entitys/order entity.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersrebo) : super(OrdersInitial());

  final Ordersrebo ordersrebo;

  Future<void> getOrders(String uID) async {
    emit(OrdersLoading());
    var result = await ordersrebo.getOrders(uID);
    result.fold(
      (Failur) => emit(
        OrdersFailure(message: Failur.message),
      ),
      (orders) => emit(
        OrdersSuccess(orders: orders),
      ),
    );
  }
}
