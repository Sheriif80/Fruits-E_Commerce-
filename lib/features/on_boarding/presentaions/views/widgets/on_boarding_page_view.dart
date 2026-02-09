import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesPageViewImage1,
          backgroundImage: Assets.imagesPageViewBacgroundImage1,
          title: Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                " مرحبًا بك في ",
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
          subtitle: const Text(
            "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            textAlign: .center,
            style: Appstyles.regular13,
          ),
        ),
        const PageViewItem(
          image: Assets.imagesPageViewImage2,
          backgroundImage: Assets.imagesPageViewBacgroundImage2,
          title: Text("ابحث وتسوق", style: Appstyles.bold23),
          subtitle: Text(
            "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            textAlign: .center,
            style: Appstyles.regular13,
          ),
        ),
      ],
    );
  }
}
