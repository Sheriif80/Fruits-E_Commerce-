import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final int now = DateTime.now().hour;
    return ListTile(
      leading: Image.asset(Assets.imagesAvatar),
      title: Text(
        now < 12 ? 'صباح الخير !..' : 'مساء الخير !..',
        textAlign: TextAlign.right,
        style: Appstyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        getUserData().name ?? 'Anonymous User',
        textAlign: TextAlign.right,
        style: Appstyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: const NotificationWidget(),
    );
  }
}
