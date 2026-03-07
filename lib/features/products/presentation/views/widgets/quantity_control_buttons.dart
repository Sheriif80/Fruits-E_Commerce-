import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class QuantityControlButtons extends StatefulWidget {
  const QuantityControlButtons({super.key});

  @override
  State<QuantityControlButtons> createState() => _QuantityControlButtonsState();
}

class _QuantityControlButtonsState extends State<QuantityControlButtons> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (quantity < 10) {
                  quantity++;
                } else {
                  AppSnackbars.showInfo(
                    context,
                    message: 'لا يمكن أن يكون الكمية أكثر من 10',
                  );
                }
              });
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        const Gap(12),
        Text(quantity.toString(), style: Appstyles.bold16),
        const Gap(12),
        CircleAvatar(
          backgroundColor: const Color(0xFFF1F1F5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (quantity > 1) quantity--;
              });
            },
            child: Icon(Icons.remove, color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}
