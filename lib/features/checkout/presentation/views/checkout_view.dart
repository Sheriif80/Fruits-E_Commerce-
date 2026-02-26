import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "الشحن", isNotificationVisible: false),
      body: const CheckoutViewBody(),
    );
  }
}
