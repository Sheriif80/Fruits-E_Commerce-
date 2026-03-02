import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String userID;
  final CartEntity cartEntity;
  bool payWithCash;
  bool payWithCard;
  ShippingAddressEntity? shippingAddress;
  OrderEntity({
    required this.userID,
    required this.cartEntity,
    this.payWithCash = true,
    this.payWithCard = false,
    required this.shippingAddress,
  });

  double calculateShippingCost() {
    if (payWithCard) {
      return 0;
    } else {
      return 40;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalOrderPrice() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
