import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ProfileListItem(
          title: S.of(context).nightMode,
          iconPath: Assets.imagesMagicpen,
          hasSwitch: true,
          switchValue: themeMode == ThemeMode.dark,
          onSwitchChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
        );
      },
    );
  }
}
