import 'package:codeblurb/data/common/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentApiProvider = Provider<PaymentApi>(
  (ref) => PaymentApi(ref.watch(dioProvider)),
  name: 'Payment API Provider',
);

class PaymentApi {
  PaymentApi(this._dio);

  final Dio _dio;

  Future<Response> getPayments() async {
    return _dio.get('/payment');
  }

  Future<Response> checkout() async {
    return _dio.post('/payments/checkout');
  }
}
