import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_response.g.dart';

@JsonSerializable(createToJson: false)
class ShoppingCartResponse {
  List<ShoppingItemResponse> shoppingItems;

  ShoppingCartResponse(this.shoppingItems);

  factory ShoppingCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartResponseFromJson(json);
}
