import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/models/review_model.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(16),
            CustomTextFormField(hintText: "اكتب تعليقك..."),
            const Gap(16),
            CustomTextFormField(
              hintText: "اكتب تقيمك...",
              keyboardType: .number,
            ),
            const Gap(16),
            CustomTextFormField(hintText: "اكتب تعليقك..."),
            const Gap(16),

            CustomButton(text: "ارسال", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
