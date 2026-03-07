import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/order_widget.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<MyOrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OrderWidget(
            orderNumber: orders[index].orderID,
            orderDate: orders[index].date,
            totalAmount: orders[index].totalPrice,
            orderStatus: orders[index].status,
          ),
        ),
        childCount: orders.length,
      ),
    );
  }
}
