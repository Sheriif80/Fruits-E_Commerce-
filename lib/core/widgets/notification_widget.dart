import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:svg_flutter/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: context.isDarkMode
          ? AppColors.darkContainer
          : Colors.white,

      child: SvgPicture.asset(
        context.isDarkMode
            ? Assets.imagesNotificationBlack
            : Assets.imagesNotificationnn,
      ),
    );
  }
}
