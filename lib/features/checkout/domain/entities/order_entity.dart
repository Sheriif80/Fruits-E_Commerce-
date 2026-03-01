import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool payWithCash;
  bool payWithCard;
  ShippingAddressEntity? shippingAddress;
  OrderEntity({
    required this.cartEntity,

    this.payWithCash = true,
    this.payWithCard = false,
    required this.shippingAddress,
  });
}
