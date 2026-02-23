import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
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
