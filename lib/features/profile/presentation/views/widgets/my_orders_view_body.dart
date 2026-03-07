import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/orders_list_view.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key, required this.orders});

  final List<MyOrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(slivers: [OrdersListView()]),
    );
  }
}
