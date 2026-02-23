import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(icon: Icons.add, color: AppColors.primaryColor),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("3", style: Appstyles.bold16),
        ),
        const CartItemActionButton(
          icon: Icons.remove,
          color: Color(0xFFF3F5F7),
          iconColor: Colors.grey,
        ),
        const Spacer(),
        Text(
          "60 جنيه",
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
  });
  final IconData icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
