import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';

AppBar showCustomAppBar(
  BuildContext context, {
  required String title,
  bool isBackVisible = true,
}) {
  return AppBar(
    backgroundColor: context.isDarkMode
        ? AppColors.darkBackground
        : Colors.white,
    title: Text(title, style: Appstyles.bold19, textAlign: .center),
    centerTitle: true,
    leading: isBackVisible
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          )
        : null,
  );
}
