import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:makani/core/erroes/Failur.dart';

import '../../../../core/network/network_info.dart';
import '../../domine/entities/payment_result.dart';
import '../models/payment_request_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentResult> postPayment(PaymentRequestModel request);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final http.Client client;
  final NetworkInfo networkInfo;

  PaymentRemoteDataSourceImpl({required this.client, required this.networkInfo});

  @override
  Future<PaymentResult> postPayment(PaymentRequestModel request) async {
    if (!await networkInfo.isConnected) {
      throw NetworkFailure('لا يوجد اتصال بالإنترنت');
    }

    final url = Uri.parse('https://api.paumob.com/v1/process-payment');

    final response = await client.post(url, body: request.toJson());

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return PaymentResult(
        success: jsonResponse['success'],
        transactionId: jsonResponse['transaction_id'],
        message: jsonResponse['message'],
      );
    } else {
      throw ServerFailure(json.decode(response.body)['error']);
    }
  }
}