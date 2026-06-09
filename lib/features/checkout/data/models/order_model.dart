import 'package:fruits_e_commerce_app/features/checkout/data/models/ordered_product_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String userID;
  final ShippingAddressModel shippingAddress;
  final double totalPrice;
  final String paymentMethod;
  final String orderID;
  final List<OrderedProductModel> orderedProducts;

  OrderModel({
    required this.userID,
    required this.shippingAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.orderID,

    required this.orderedProducts,
  });

  factory OrderModel.fromEntity(OrderInputEntity entity) => OrderModel(
    userID: entity.userID,
    shippingAddress: ShippingAddressModel.fromEntity(entity.shippingAddress!),
    totalPrice: entity.payWithCard || entity.payWithStripe
        ? entity.cartEntity.calculateTotalPrice()
        : entity.cartEntity.calculateTotalPrice() + 40,
    paymentMethod: entity.payWithCard
        ? "Card(Paypal)"
        : entity.payWithCash
        ? "Cash"
        : "Card(Stripe)",
    orderID: const Uuid().v4(),
    orderedProducts: entity.cartEntity.cartItems
        .map((e) => OrderedProductModel.fromEntity(e))
        .toList(),
  );

  toJson() => {
    "userID": userID,
    "shippingAddress": shippingAddress.toJson(),
    "status": "pending",
    "date": DateTime.now().toString(),
    "totalPrice": totalPrice,
    "paymentMethod": paymentMethod,
    "orderID": orderID,
    "orderedProducts": orderedProducts.map((e) => e.toJson()).toList(),
  };
}
