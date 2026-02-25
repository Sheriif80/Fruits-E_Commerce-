import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            title: getSteps()[index],
            index: index + 1,
            isActive: index == 0,
          ),
        );
      }),
    );
  }
}

List<String> getSteps() => ["الشحن", "العنوان", "الدفع", "المراجعة"];
