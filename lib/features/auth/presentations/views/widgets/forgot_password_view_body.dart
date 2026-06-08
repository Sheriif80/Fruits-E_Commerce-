import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    String email = '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              s.forgotPasswordDescription,
              textAlign: TextAlign.right,
              style: Appstyles.semiBold16.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              hintText: s.enterEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: s.forgotPasswordTitle,
              onPressed: () {
                if (email.isNotEmpty) {
                  context.read<ResetPasswordCubit>().resetPassword(
                    email: email,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
