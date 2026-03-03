import 'package:fruits_e_commerce_app/features/checkout/data/models/ordered_product_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String userID;
  final ShippingAddressModel shippingAddress;
  final double totalPrice;
  final String paymentMethod;
  final List<OrderedProductModel> orderedProducts;

  OrderModel({
    required this.userID,
    required this.shippingAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.orderedProducts,
  });

  factory OrderModel.fromEntity(OrderEntity entity) => OrderModel(
    userID: entity.userID,
    shippingAddress: ShippingAddressModel.fromEntity(entity.shippingAddress!),
    totalPrice: entity.payWithCard
        ? entity.cartEntity.calculateTotalPrice()
        : entity.cartEntity.calculateTotalPrice() + 40,
    paymentMethod: entity.payWithCard ? "Card(Paypal)" : "Cash",
    orderedProducts: entity.cartEntity.cartItems
        .map((e) => OrderedProductModel.fromEntity(e))
        .toList(),
  );

  toJson() => {
    "userID": userID,
    "shippingAddress": shippingAddress.toJson(),
    "status": "Pending",
    "totalPrice": totalPrice,
    "paymentMethod": paymentMethod,
    "orderedProducts": orderedProducts.map((e) => e.toJson()).toList(),
  };
}
