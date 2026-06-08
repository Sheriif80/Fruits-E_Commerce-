import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_section_title.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/theme_switcher_button.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const ProfileHeader(),
          ProfileSectionTitle(title: s.general),
          ProfileListItem(
            title: s.profileInfo,
            iconPath: Assets.imagesProfileIconsUser,
          ),
          ProfileListItem(
            title: s.myOrders,
            iconPath: Assets.imagesProfileIconsBox,
            path: AppRoutes.myOrdersView,
          ),
          ProfileListItem(
            title: s.payments,
            iconPath: Assets.imagesProfileIconsEmptyWallet,
          ),
          ProfileListItem(
            title: s.favorites,
            iconPath: Assets.imagesProfileIconsHeart,
            path: AppRoutes.favoritesView,
          ),
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return ProfileListItem(
                title: s.language,
                iconPath: Assets.imagesProfileIconsGlobal,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    locale.languageCode == 'ar' ? 'English' : 'العربية',
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  context.read<LocaleCubit>().toggleLanguage();
                },
              );
            },
          ),
          const ThemeSwitcherButton(),
          ProfileSectionTitle(title: s.help),
          ProfileListItem(
            title: s.aboutUs,
            iconPath: Assets.imagesProfileIconsInfoCircle,
          ),
          const Gap(15),
          const LogoutButton(),
          const Gap(15),
        ],
      ),
    );
  }
}
