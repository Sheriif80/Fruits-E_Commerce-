import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 11.5,
          child: const Icon(Icons.check, color: Colors.white, size: 17),
        ),
        const Gap(4),
        Text(
          title,
          style: Appstyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
