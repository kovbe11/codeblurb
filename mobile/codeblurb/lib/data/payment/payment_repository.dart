import 'package:codeblurb/data/common/handle_request.dart';
import 'package:codeblurb/data/payment/models/previous_payments_response.dart';
import 'package:codeblurb/data/payment/payment_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentRepoProvider = Provider<PaymentRepository>(
  (ref) => PaymentRepository(ref.watch(paymentApiProvider)),
  name: 'Payment Repository Provider',
);

class PaymentRepository {
  final PaymentApi _paymentApi;

  PaymentRepository(this._paymentApi);

  Future<PreviousPaymentsResponse> getPayments() async {
    return handleRequest(
      request: _paymentApi.getPayments(),
      jsonParser: PreviousPaymentsResponse.fromJson,
    );
  }

  Future<dynamic> checkout() async {
    return handleRequest(
        request: _paymentApi.checkout(), jsonParser: (json) {});
  }
}
