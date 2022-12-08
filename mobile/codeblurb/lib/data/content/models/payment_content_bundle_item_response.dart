import 'package:codeblurb/data/common/network/models/content_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_content_bundle_item_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentContentBundleItemResponse {
  final String name;
  final ContentType contentType;

  PaymentContentBundleItemResponse(this.name, this.contentType);

  factory PaymentContentBundleItemResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentContentBundleItemResponseFromJson(json);
}
