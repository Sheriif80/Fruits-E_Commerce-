import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomProductDetailsContainer extends StatelessWidget {
  const CustomProductDetailsContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });
  final String title, subtitle, iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Appstyles.bold16.copyWith(
                  color: AppColors.lightpPrimaryColor,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(iconPath),
            ],
          ),
          Text(
            subtitle,
            style: Appstyles.semiBold13.copyWith(
              color: const Color(0xFF969899),
            ),
          ),
        ],
      ),
    );
  }
}
