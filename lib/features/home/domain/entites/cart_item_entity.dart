import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 1});

  num calculateTotalPrice() => productEntity.price * quantity;

  num calculateTotalWeight() => productEntity.unitAmount * quantity;

  int increaseQuantity() => quantity++;

  int decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    return quantity;
  }
}
