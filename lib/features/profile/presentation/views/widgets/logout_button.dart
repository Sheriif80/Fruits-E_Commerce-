import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: double.infinity,
      color: const Color(0xFFEBF9F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          Text(
            'تسجيل الخروج',
            style: Appstyles.semiBold13.copyWith(
              color: const Color(0xFF1B5E37),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.imagesProfileIconsLogout),
          const Gap(20),
        ],
      ),
    );
  }
}
