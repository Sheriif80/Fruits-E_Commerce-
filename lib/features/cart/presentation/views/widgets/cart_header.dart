import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 91, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.darkContainer : Color(0xFFEBF9F1),
      ),
      child: Text(
        S.of(context).cartItemsCount(
          context.watch<CartCubit>().cartEntity.cartItems.length,
        ),
        style: Appstyles.regular13.copyWith(
          color: context.isDarkMode ? Colors.white : AppColors.primaryColor,
        ),
      ),
    );
  }
}
