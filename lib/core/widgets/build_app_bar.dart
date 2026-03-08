import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  bool isNotificationVisible = true,
}) {
  return AppBar(
    backgroundColor: context.isDarkMode
        ? AppColors.darkBackground
        : Colors.white,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Visibility(
          visible: isNotificationVisible,
          child: const NotificationWidget(),
        ),
      ),
    ],
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: Appstyles.bold19.copyWith(
        color: context.isDarkMode ? Colors.white : AppColors.blackColor,
      ),
    ),
  );
}
