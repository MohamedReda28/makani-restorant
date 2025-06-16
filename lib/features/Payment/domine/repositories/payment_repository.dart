import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import '../../data/models/payment_request_model.dart';
import '../entities/payment_result.dart';

abstract class PaymentRepository {
  Future<Either<Failur, PaymentResult>> processPayment(PaymentRequestModel request);
}