import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem(CartItemEntity cartItemEntity) =>
      cartItems.add(cartItemEntity);

  bool isItemInCart(ProductEntity productEntity) =>
      cartItems.contains(CartItemEntity(productEntity: productEntity));
}
