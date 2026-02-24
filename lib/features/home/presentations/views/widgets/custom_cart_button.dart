import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/cubits/care_item_cubit/cart_item_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/cubits/cart_cubit/cart_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text:
                "الدفع الان  :  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
            onPressed: () {},
          ),
        );
      },
    );
  }
}
