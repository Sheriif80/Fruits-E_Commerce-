import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

AppBar buildAppBar({required String title, bool isNotificationVisible = true}) {
  return AppBar(
    backgroundColor: Colors.white,
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
      style: Appstyles.bold19.copyWith(color: const Color(0xFF0C0D0D)),
    ),
  );
}
