import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/address_summary.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:gap/gap.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [Gap(16), OrderSummary(), Gap(24), AddressSummary()],
      ),
    );
  }
}
