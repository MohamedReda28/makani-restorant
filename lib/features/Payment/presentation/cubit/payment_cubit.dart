import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import '../../data/models/payment_request_model.dart';
import '../../domine/entities/payment_result.dart';
import '../../domine/usecases/process_payment.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ProcessPayment processPayment;

  PaymentCubit({required this.processPayment}) : super(PaymentInitial());

  Future<void> startPayment(PaymentRequestModel request) async {
    emit(PaymentLoading());
    final Either<Failur, PaymentResult> result = await processPayment(request);
    result.fold(
          (failure) => emit(PaymentFailed(failure.message)),
          (paymentResult) => emit(PaymentSuccess(paymentResult)),
    );
  }
}