import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class ProductsViewResultHeader extends StatelessWidget {
  const ProductsViewResultHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength نتائج',
          textAlign: TextAlign.right,
          style: Appstyles.regular16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5.5),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesArrowSwap),
        ),
      ],
    );
  }
}
