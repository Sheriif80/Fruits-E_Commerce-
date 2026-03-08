import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.tile, required this.child});

  final String tile;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$tile:', style: Appstyles.bold13),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: ShapeDecoration(
            color: context.isDarkMode
                ? AppColors.darkContainer
                : const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
