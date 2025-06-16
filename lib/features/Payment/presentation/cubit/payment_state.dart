part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final PaymentResult result;

  PaymentSuccess(this.result);
}

class PaymentFailed extends PaymentState {
  final String error;

  PaymentFailed(this.error);
}