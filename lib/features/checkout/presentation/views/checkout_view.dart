import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      userID: getUserData().userId!,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "الشحن", isNotificationVisible: false),
      body: Provider.value(value: orderEntity, child: const CheckoutViewBody()),
    );
  }
}
