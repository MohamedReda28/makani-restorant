import 'package:makani/core/erroes/Failur.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domine/entities/payment_result.dart';
import '../../domine/repositories/payment_repository.dart';
import '../datasources/payment_remote_data_source.dart';
import '../models/payment_request_model.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PaymentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failur, PaymentResult>> processPayment(PaymentRequestModel request) async {
    try {
      final result = await remoteDataSource.postPayment(request);
      return Right(result);
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("حدث خطأ غير متوقع"));
    }
  }
}