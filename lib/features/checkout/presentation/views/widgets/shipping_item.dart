import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .start,

          children: [
            Container(
              width: 18,
              height: 18,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    color: Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Appstyles.semiBold13),
                Gap(6),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: Appstyles.regular13.copyWith(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                '$price ',
                style: Appstyles.bold13.copyWith(
                  color: AppColors.lightpPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
