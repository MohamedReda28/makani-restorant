import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import '../../data/models/payment_request_model.dart';
import '../repositories/payment_repository.dart';
import '../entities/payment_result.dart';

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<Either<Failur, PaymentResult>> call(PaymentRequestModel request) async {
    return await repository.processPayment(request);
  }
}