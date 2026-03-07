import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/cubits/get_my_orders_cubit/get_my_orders_cubit.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/my_orders_view_body.dart';

class MyOrdersViewBodyBlocBuilder extends StatelessWidget {
  const MyOrdersViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
      builder: (context, state) {
        if (state is GetMyOrdersFailure) {
          return Center(child: Text(state.message));
        }
        if (state is GetMyOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetMyOrdersSuccess) {
          return MyOrdersViewBody(orders: state.myOrders);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
