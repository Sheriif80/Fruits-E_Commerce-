import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity order) =>
      PaypalPaymentEntity(
        amount: Amount.fromEntity(order),
        description: "Payment description",
        itemList: ItemList.fromEntity(order.cartEntity.cartItems),
      );
}
