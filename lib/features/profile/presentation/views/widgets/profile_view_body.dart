import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_section_title.dart';
import 'package:gap/gap.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const ProfileHeader(),

          const ProfileSectionTitle(title: "عام"),

          ProfileListItem(
            title: "الملف الشخصي",
            iconPath: Assets.imagesProfileIconsUser,
            onTap: () {},
          ),

          ProfileListItem(
            title: "طلباتي",
            iconPath: Assets.imagesProfileIconsBox,
            onTap: () {},
          ),
          ProfileListItem(
            title: "المدفوعات",
            iconPath: Assets.imagesProfileIconsEmptyWallet,
            onTap: () {},
          ),
          ProfileListItem(
            title: "المفضلة",
            iconPath: Assets.imagesProfileIconsHeart,
            onTap: () {},
          ),

          ProfileListItem(
            title: "اللغة",
            iconPath: Assets.imagesProfileIconsGlobal,
            onTap: () {},
          ),

          const ProfileSectionTitle(title: "المساعدة"),

          ProfileListItem(
            title: "من نحن",
            iconPath: Assets.imagesProfileIconsInfoCircle,
            onTap: () {},
          ),
          const Gap(15),
          const LogoutButton(),
          const Gap(15),
        ],
      ),
    );
  }
}
