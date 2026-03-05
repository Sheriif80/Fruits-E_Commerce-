import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem(CartItemEntity cartItemEntity) =>
      cartItems.add(cartItemEntity);

  void removeCartItem(CartItemEntity cartItemEntity) {
    final CartItemEntity? item = findItem(cartItemEntity.productEntity);
    if (item != null) {
      cartItems.remove(item);
    }
  }

  void removeIfQuantityZero() {
    if (cartItems.any((element) => element.quantity == 0)) {
      cartItems.removeWhere((element) => element.quantity == 0);
    }
  }

  CartItemEntity? findItem(ProductEntity productEntity) {
    for (final item in cartItems) {
      if (item.productEntity.code == productEntity.code) {
        return item;
      }
    }
    return null;
  }

  bool isItemInCart(ProductEntity productEntity) =>
      findItem(productEntity) != null;

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.calculateTotalPrice();
    }
    return totalPrice;
  }
}
