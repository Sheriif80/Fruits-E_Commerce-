import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/order_created_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class OrderCreatedView extends StatelessWidget {
  const OrderCreatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,

        title: S.of(context).payment,
        isNotificationVisible: false,
      ),

      body: const OrderCreatedViewBody(),
    );
  }
}
