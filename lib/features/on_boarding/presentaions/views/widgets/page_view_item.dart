import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    this.isVisible = false,
  });
  final String image;
  final String backgroundImage;

  final Widget title;
  final Widget subtitle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: BlocBuilder<LocaleCubit, Locale>(
                  builder: (context, locale) {
                    return GestureDetector(
                      onTap: () {
                        context.read<LocaleCubit>().toggleLanguage();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          locale.languageCode == 'ar' ? 'English' : 'العربية',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (isVisible)
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      CacheHelper.saveData(
                        key: kIsOnBoardingVisible,
                        value: true,
                      );
                      GoRouter.of(context).pushReplacement(AppRoutes.loginView);
                    },
                    child: Text(
                      S.of(context).onBoardingSkip,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Gap(40),
        title,
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: subtitle,
        ),
      ],
    );
  }
}
