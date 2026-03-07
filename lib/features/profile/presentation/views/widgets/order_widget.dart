import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 107,
      decoration: const BoxDecoration(color: Color(0x7FF2F3F3)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: const Color(0xFFEBF9F1),
            child: SvgPicture.asset(Assets.imagesOrder),
          ),
          const Gap(7),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('طلب رقم: 1234567#', style: Appstyles.bold13),
              const Gap(6),
              Text(
                'تم الطلب :22 مارس ,2024',
                style: Appstyles.regular11.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
              const Gap(6),
              const Text("الاجمالي : 100 جنيه", style: Appstyles.bold13),
            ],
          ),
        ],
      ),
    );
  }
}
