import 'package:codeblurb/data/payment/payment_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentRepoProvider = Provider<PaymentRepository>(
  (ref) => PaymentRepository(ref.watch(paymentApiProvider)),
  name: 'Payment Repository Provider',
);

class PaymentRepository {
  final PaymentApi _paymentApi;

  PaymentRepository(this._paymentApi);

  Future<dynamic> getPayments() async {
    return _paymentApi.getPayments();
  }

  Future<dynamic> checkout() async {
    return _paymentApi.checkout();
  }
}
