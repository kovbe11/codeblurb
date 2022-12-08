import 'package:codeblurb/data/content/models/payment_content_bundle_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentContentBundleResponse {
  List<PaymentContentBundleItemResponse> includedContent;

  PaymentContentBundleResponse(this.includedContent);

  factory PaymentContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentContentBundleResponseFromJson(json);
}
