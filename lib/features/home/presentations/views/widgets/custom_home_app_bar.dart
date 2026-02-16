import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesAvatar),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: Appstyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        'شريف أشرف',
        textAlign: TextAlign.right,
        style: Appstyles.regular16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}
