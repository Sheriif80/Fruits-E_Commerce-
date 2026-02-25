import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(children: [CheckoutSteps()]),
    );
  }
}
