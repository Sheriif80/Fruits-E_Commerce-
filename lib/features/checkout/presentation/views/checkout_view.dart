import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/add_order_bloc_consumer.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      userID: getUserData().userId!,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,

          title: "الشحن",
          isNotificationVisible: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderBlocConsumer(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
