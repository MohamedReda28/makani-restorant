part of 'orders_cubit.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersFailure extends OrdersState {
  final String message;
  const OrdersFailure({required this.message});
}
final class OrdersSuccess extends OrdersState {
  final List<DisplayOrderEntity>  orders;

  OrdersSuccess({required this.orders});
}