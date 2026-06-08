import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
  });
  final int currentStep;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final steps = getSteps(context);
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (index < currentStep) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: StepItem(
              title: steps[index],
              index: index + 1,
              isActive: index < currentStep,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps(BuildContext context) {
  final s = S.of(context);
  return [s.shipping, s.address, s.payment];
}
