import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/care_item_cubit/cart_item_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        appBar: buildAppBar(title: 'السلة', isNotificationVisible: false),

        body: const SafeArea(child: CartViewBody()),
      ),
    );
  }
}
