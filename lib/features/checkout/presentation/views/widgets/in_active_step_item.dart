import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFF2F3F3),
          radius: 10,
          child: Text("2", style: Appstyles.semiBold13),
        ),
        const Gap(4),
        Text(
          "العنوان",
          style: Appstyles.semiBold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
