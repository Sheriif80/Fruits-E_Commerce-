import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:go_router/go_router.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟',
            style: Appstyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).pushNamed(AppRoutes.singupView);
              },
            text: ' قم بانشاء حساب',
            style: Appstyles.semiBold16,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
