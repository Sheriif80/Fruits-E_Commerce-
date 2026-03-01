import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/address_summary.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:gap/gap.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(16),
          const OrderSummary(),
          const Gap(24),
          AddressSummary(pageController: pageController),
        ],
      ),
    );
  }
}
