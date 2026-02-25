import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view_builder.dart';
import 'package:gap/gap.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const Gap(15),
          const CheckoutSteps(),
          Expanded(
            child: CheckoutStepsPageViewBuilder(pageController: pageController),
          ),
          CustomButton(text: "التالي", onPressed: () {}),
          const Gap(25),
        ],
      ),
    );
  }
}
