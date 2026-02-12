import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: AppColors.lightpPrimaryColor,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: Appstyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام ',
                  style: Appstyles.semiBold13.copyWith(
                    color: AppColors.lightpPrimaryColor,
                  ),
                ),
                TextSpan(
                  text: 'الخاصة بنا',
                  style: Appstyles.semiBold13.copyWith(
                    color: AppColors.lightpPrimaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
