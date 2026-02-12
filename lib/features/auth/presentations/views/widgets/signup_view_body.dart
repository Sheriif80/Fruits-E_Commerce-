import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/have_an_account_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/terms_and_conditions.dart';
import 'package:gap/gap.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            const CustomTextFormField(
              keyboardType: TextInputType.name,
              hintText: ' الاسم كاملاً',
            ),
            const Gap(16),
            const CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'البريد الإلكتروني',
            ),
            const Gap(16),
            const CustomTextFormField(
              keyboardType: TextInputType.visiblePassword,
              hintText: 'كلمة المرور',
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            const Gap(16),
            const TermsAndConditions(),
            const Gap(30),
            CustomButton(text: "إنشاء حساب جديد ", onPressed: () {}),
            const Gap(24),
            const HaveAnAccountWidget(),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
