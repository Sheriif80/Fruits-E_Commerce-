import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem(CartItemEntity cartItemEntity) =>
      cartItems.add(cartItemEntity);
}
