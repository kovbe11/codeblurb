import 'package:codeblurb/data/common/handle_request.dart';
import 'package:codeblurb/data/shopping/models/get_available_shopping_items_response.dart';
import 'package:codeblurb/data/shopping/models/shopping_cart_response.dart';
import 'package:codeblurb/data/shopping/shopping_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingRepoProvider = Provider<ShoppingRepository>(
  (ref) => ShoppingRepository(ref.watch(shoppingApiProvider)),
  name: 'Shopping Repository Provider',
);

class ShoppingRepository {
  final ShoppingApi _shoppingApi;

  ShoppingRepository(this._shoppingApi);

  Future<ShoppingCartResponse> addItemToCart(
          {required int shoppingCartItemId}) async =>
      handleRequest(
        request: _shoppingApi.addItem(shoppingCartItemId: shoppingCartItemId),
        jsonParser: ShoppingCartResponse.fromJson,
      );

  Future<ShoppingCartResponse> restoreShoppingCart() async {
    return handleRequest(
      request: _shoppingApi.restoreShoppingCart(),
      jsonParser: ShoppingCartResponse.fromJson,
    );
  }

  Future<GetAvailableShoppingItemsResponse> getAvailableShoppingItems() async {
    return handleRequest(
      request: _shoppingApi.getAvailableShoppingItems(),
      jsonParser: GetAvailableShoppingItemsResponse.fromJson,
    );
  }

  Future<ShoppingCartResponse> removeItemFromCart(
      {required int shoppingCartItemId}) async {
    return handleRequest(
      request: _shoppingApi.removeItemFromCart(
          shoppingCartItemId: shoppingCartItemId),
      jsonParser: ShoppingCartResponse.fromJson,
    );
  }
}
