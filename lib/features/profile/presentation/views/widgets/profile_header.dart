import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 36.5,
              backgroundImage: AssetImage(Assets.imagesAvatar),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.camera_alt, size: 18),
            ),
          ],
        ),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              getUserData().name ?? 'Anonymous User',
              style: Appstyles.bold13,
            ),
            const SizedBox(height: 8),
            Text(
              getUserData().email ?? 'Anonymous User',
              style: Appstyles.regular13.copyWith(
                color: const Color(0xFF888FA0),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}
