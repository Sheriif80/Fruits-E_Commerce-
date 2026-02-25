import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return index == 0
            ? Expanded(child: ActiveStepItem(title: getSteps()[index]))
            : Expanded(
                child: InActiveStepItem(
                  title: getSteps()[index],
                  index: index + 1,
                ),
              );
      }),
    );
  }
}

List<String> getSteps() => ["الشحن", "العنوان", "الدفع", "المراجعة"];
