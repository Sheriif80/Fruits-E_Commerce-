import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          image: Assets.imagesPageViewImage1,
          backgroundImage: Assets.imagesPageViewBacgroundImage1,
          title: Row(
            mainAxisAlignment: .center,
            children: [Text(" مرحبًا بك في"), Text("Fruit"), Text("HUB")],
          ),
          subtitle: Text(
            "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            textAlign: .center,
          ),
        ),
        PageViewItem(
          image: Assets.imagesPageViewImage2,
          backgroundImage: Assets.imagesPageViewBacgroundImage2,
          title: Text("ابحث وتسوق"),
          subtitle: Text(
            "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            textAlign: .center,
          ),
        ),
      ],
    );
  }
}
