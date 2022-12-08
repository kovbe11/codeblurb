import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_available_shopping_items_response.g.dart';

@JsonSerializable(createToJson: false)
class GetAvailableShoppingItemsResponse {
  GetAvailableShoppingItemsResponse(this.shoppingItems);

  final List<ShoppingItemResponse> shoppingItems;

  factory GetAvailableShoppingItemsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAvailableShoppingItemsResponseFromJson(json);
}
