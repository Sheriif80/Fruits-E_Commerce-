import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgg;
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/featured_item_button.dart';
import 'package:gap/gap.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width - 32;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              right: itemWidth * 0.4,
              child: Image.asset(Assets.imagesStrawberryTest, fit: BoxFit.fill),
            ),
            Container(
              width: itemWidth * 0.5,

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: svgg.Svg(Assets.imagesFeaturedBackground),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(25),
                    Opacity(
                      opacity: 0.90,
                      child: Text(
                        'عروض العيد',
                        style: Appstyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: Appstyles.bold19.copyWith(color: Colors.white),
                    ),
                    const Gap(11),
                    FeaturedItemButton(onPressed: () {}),
                    const Gap(29),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
