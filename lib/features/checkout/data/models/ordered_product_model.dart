import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';

class OrderedProductModel {
  final String code;
  final String name;
  final int quantity;
  final num price;

  OrderedProductModel({
    required this.code,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderedProductModel.fromEntity(CartItemEntity cartItemEntity) =>
      OrderedProductModel(
        code: cartItemEntity.productEntity.code,
        name: cartItemEntity.productEntity.name,
        quantity: cartItemEntity.quantity,
        price: cartItemEntity.calculateTotalPrice(),
      );

  toJson() => {
    'code': code,
    'name': name,
    'quantity': quantity,
    'price': price,
  };
}
