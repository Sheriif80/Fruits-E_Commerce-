import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:gap/gap.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: context.isDarkMode
              ? AppColors.darkContainer
              : const Color(0xFFF2F3F3),
          radius: 10,
          child: Text(index.toString(), style: Appstyles.semiBold13),
        ),
        const Gap(4),
        Text(
          title,
          style: Appstyles.semiBold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
