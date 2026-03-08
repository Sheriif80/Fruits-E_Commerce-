import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_section_title.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/theme_switcher_button.dart';
import 'package:gap/gap.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: const [
          ProfileHeader(),
          ProfileSectionTitle(title: "عام"),
          ProfileListItem(
            title: "الملف الشخصي",
            iconPath: Assets.imagesProfileIconsUser,
            path: AppRoutes.myOrdersView,
          ),

          ProfileListItem(
            title: "طلباتي",
            iconPath: Assets.imagesProfileIconsBox,
            path: AppRoutes.myOrdersView,
          ),
          ProfileListItem(
            title: "المدفوعات",
            iconPath: Assets.imagesProfileIconsEmptyWallet,
            path: AppRoutes.myOrdersView,
          ),
          ProfileListItem(
            title: "المفضلة",
            iconPath: Assets.imagesProfileIconsHeart,
            path: AppRoutes.myOrdersView,
          ),
          ProfileListItem(
            title: "اللغة",
            iconPath: Assets.imagesProfileIconsGlobal,
            path: AppRoutes.myOrdersView,
          ),
          ThemeSwitcherButton(),
          ProfileSectionTitle(title: "المساعدة"),
          ProfileListItem(
            title: "من نحن",
            iconPath: Assets.imagesProfileIconsInfoCircle,
            path: AppRoutes.myOrdersView,
          ),
          Gap(15),
          LogoutButton(),
          Gap(15),
        ],
      ),
    );
  }
}
