import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/my_orders_view_body_bloc_builder.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMyOrdersCubit(getIt.get<OrderRepo>())
            ..getMyOrders(userID: getUserData().userId!),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: "طلباتي",
          isNotificationVisible: false,
        ),
        body: const MyOrdersViewBodyBlocBuilder(),
      ),
    );
  }
}
