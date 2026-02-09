import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/widgets/on_boarding_page_view.dart';
import 'package:gap/gap.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          position: currentPage.toDouble(),
          animate: true,
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withValues(alpha: 0.5),
          ),
        ),
        const Gap(29),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(text: "ابدأ الان", onPressed: () {}),
          ),
        ),
        const Gap(35),
      ],
    );
  }
}
