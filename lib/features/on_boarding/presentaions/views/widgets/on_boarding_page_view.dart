import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/widgets/page_view_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesPageViewImage1,
          backgroundImage: Assets.imagesPageViewBacgroundImage1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                s.onBoardingWelcome,
                style: Appstyles.bold23.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              Text(
                "HUB",
                style: Appstyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                "Fruit",
                style: Appstyles.bold23.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          subtitle: Text(
            s.onBoardingDescription,
            textAlign: TextAlign.center,
            style: Appstyles.regular13,
          ),
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesPageViewImage2,
          backgroundImage: Assets.imagesPageViewBacgroundImage2,
          title: Text(s.onBoardingSearchTitle, style: Appstyles.bold23),
          subtitle: Text(
            s.onBoardingSearchDescription,
            textAlign: TextAlign.center,
            style: Appstyles.regular13,
          ),
        ),
      ],
    );
  }
}
