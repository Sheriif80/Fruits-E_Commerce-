import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onTap: cartItemEntity.increaseQuantity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.quantity.toString(),
            style: Appstyles.bold16,
          ),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          iconColor: Colors.grey,
          onTap: cartItemEntity.decreaseQuantity,
        ),
        const Spacer(),
        Text(
          "${cartItemEntity.calculateTotalPrice()} جنيه",
          style: Appstyles.bold16.copyWith(color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    this.iconColor = Colors.white,
    this.onTap,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        child: Container(
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Icon(icon, color: iconColor, size: 17),
        ),
      ),
    );
  }
}
