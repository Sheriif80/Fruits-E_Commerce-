import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/order_widget.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: OrderWidget(),
        ),
        childCount: 20,
      ),
    );
  }
}
