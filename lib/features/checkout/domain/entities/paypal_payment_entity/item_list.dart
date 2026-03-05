import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  factory ItemList.fromEntity(List<CartItemEntity> cartItems) =>
      ItemList(items: cartItems.map((e) => ItemEntity.fromEntity(e)).toList());
}
