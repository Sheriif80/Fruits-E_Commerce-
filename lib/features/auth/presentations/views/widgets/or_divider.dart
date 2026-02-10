import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Gap(16),
        Text("أو", style: Appstyles.semiBold13),
        Gap(16),
        Expanded(child: Divider()),
      ],
    );
  }
}
