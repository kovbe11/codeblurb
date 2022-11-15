import 'package:codeblurb/data/shopping/shopping_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingRepoProvider = Provider<ShoppingRepository>(
  (ref) => ShoppingRepository(ref.watch(shoppingApiProvider)),
  name: 'Shopping Repository Provider',
);

class ShoppingRepository {
  final ShoppingApi _shoppingApi;

  ShoppingRepository(this._shoppingApi);

  Future<dynamic> addItemToCart({required int shoppingCartItemId}) async {
    return _shoppingApi.addItem(shoppingCartItemId: shoppingCartItemId);
  }

  Future<dynamic> restoreShoppingCart() async {
    return _shoppingApi.restoreShoppingCart();
  }

  Future<dynamic> getAvailableShoppingItems() async {
    return _shoppingApi.getAvailableShoppingItems();
  }

  Future<dynamic> removeItemFromCart({required int shoppingCartItemId}) async {
    return _shoppingApi.removeItemFromCart(
        shoppingCartItemId: shoppingCartItemId);
  }

  Future<dynamic> echo({required String text}) async {
    _shoppingApi.echo(text: text);
  }
}
