import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddress;
  OrderEntity({
    required this.cartItems,
    required this.payWithCash,
    required this.shippingAddress,
  });
}
